//
//  SkeletonUIView.swift
//  NewsSample
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import UIKit

class SkeletonUIView: UIView {
    var animatingGriadintColor: UIColor = .gray

    override init(frame: CGRect) {
        super.init(frame: frame)
        addObserver()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    @objc private func applicationDidBecomeActive() {
        layer.sublayers?.removeAll()
        addGradientSublayerWithAnimation(gradientView: self, color: animatingGriadintColor)
    }
}
