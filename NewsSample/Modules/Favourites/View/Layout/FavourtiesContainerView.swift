//
//  FavourtiesContainerView.swift
//  NewsSample
//
//  Created Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class FavourtiesContainerView: UIView {
    var presenter: FavourtiesPresenterProtocol

    init(presenter: FavourtiesPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = ColorTypes.background.value
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
