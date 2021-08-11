//
//  HeadLinesContainerView.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class HeadLinesContainerView: UIView {
    var presenter: HeadLinesPresenterProtocol

    init(presenter: HeadLinesPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layoutUserInterFace()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterFace() {
        self.addSubViews()
    }

    private func addSubViews() {}
}
