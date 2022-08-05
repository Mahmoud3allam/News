//
//  HeadLinesCell.swift
//  NewsSample
//
//  Created by Alchemist on 13/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit
class HeadLinesCell: UITableViewCell {
    lazy var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    lazy var headlineImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .lightGray
        return image
    }()

    lazy var headLineDateLabel: LabelWithInset = {
        let label = LabelWithInset()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.backgroundColor = .red
        if let font = UIFont(name: FontTypes.semiBold.name, size: 15) {
            label.font = font
        }
        label.text = "10/7/2022"
        label.textAlignment = .center
        label.layer.cornerRadius = 12
        label.insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        label.textColor = .white
        return label
    }()

    lazy var headLineTitleLabel: LabelWithInset = {
        let label = LabelWithInset()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = ColorTypes.background.value.withAlphaComponent(0.4)
        if let font = UIFont(name: FontTypes.boldFont.name, size: 16) {
            label.font = font
        }
        label.text = "Steelers at Eagles score: Live updates, game stats, highlights for NFL preseason game in Philadelphia - CBSSports.com"
        label.textAlignment = .left
        label.insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        label.textColor = ColorTypes.mainTextColor.value
        return label
    }()

    lazy var headLineDescriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = "Eagles open their preseason against the Steelers in a battle of Pennsylvania"
        label.font = UIFont(name: FontTypes.regularFont.name, size: 16)
        label.numberOfLines = 0
        label.textColor = ColorTypes.mainTextColor.value
        return label
    }()

    lazy var favouriteButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "favorite_d"), for: .normal)
        button.tintColor = .red
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(didTappedFavButton), for: .touchUpInside)
        return button
    }()

    lazy var headLineSourceLabel: LabelWithInset = {
        let label = LabelWithInset()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = ColorTypes.background.value.withAlphaComponent(0.4)
        if let font = UIFont(name: FontTypes.boldFont.name, size: 16) {
            label.font = font
        }
        label.text = "By: CBS Sports"
        label.textAlignment = .left
        label.insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        label.textColor = ColorTypes.mainTextColor.value
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.layoutUserInterFace()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterFace() {
        self.addSubViews()
        self.setupContainerViewConstraints()
        self.setupHeadLineImageViewConstraints()
        self.setupHeadLineDateLabelConstraints()
        self.setupHeadLineTitleLabelConstraints()
        self.setupHeadLineDescriptionLabelConstraints()
        self.setupFavouriteButtonConstraints()
        self.setupHeadLineSourceLabelConstraints()
    }

    private func addSubViews() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.headlineImageView)
        self.containerView.addSubview(self.headLineDateLabel)
        self.containerView.addSubview(self.headLineTitleLabel)
        self.containerView.addSubview(self.headLineDescriptionLabel)
        self.containerView.addSubview(self.headLineSourceLabel)
        self.containerView.addSubview(self.favouriteButton)
    }

    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }

    private func setupHeadLineImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.headlineImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0),
            self.headlineImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10),
            self.headlineImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10),
            self.headlineImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    private func setupHeadLineDateLabelConstraints() {
        NSLayoutConstraint.activate([
            self.headLineDateLabel.leadingAnchor.constraint(equalTo: self.headlineImageView.leadingAnchor, constant: 12),
            self.headLineDateLabel.bottomAnchor.constraint(equalTo: self.headlineImageView.bottomAnchor, constant: -12),
            self.headLineDateLabel.heightAnchor.constraint(equalToConstant: 30)

        ])
    }

    private func setupHeadLineTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            self.headLineTitleLabel.leadingAnchor.constraint(equalTo: self.headlineImageView.leadingAnchor, constant: 12),
            self.headLineTitleLabel.trailingAnchor.constraint(equalTo: self.headlineImageView.trailingAnchor, constant: -12),
            self.headLineTitleLabel.bottomAnchor.constraint(equalTo: self.headLineDateLabel.topAnchor, constant: -2),
            self.headLineTitleLabel.heightAnchor.constraint(lessThanOrEqualTo: self.headlineImageView.heightAnchor, multiplier: 0.5)
        ])
    }

    private func setupHeadLineDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            self.headLineDescriptionLabel.topAnchor.constraint(equalTo: self.headlineImageView.bottomAnchor, constant: 0),
            self.headLineDescriptionLabel.leadingAnchor.constraint(equalTo: self.headlineImageView.leadingAnchor),
            self.headLineDescriptionLabel.trailingAnchor.constraint(equalTo: self.headlineImageView.trailingAnchor),
            self.headLineDescriptionLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10)
        ])
    }

    private func setupFavouriteButtonConstraints() {
        NSLayoutConstraint.activate([
            self.favouriteButton.trailingAnchor.constraint(equalTo: self.headLineTitleLabel.trailingAnchor),
            self.favouriteButton.heightAnchor.constraint(equalToConstant: 36),
            self.favouriteButton.widthAnchor.constraint(equalToConstant: 36),
            self.favouriteButton.topAnchor.constraint(equalTo: self.headlineImageView.topAnchor, constant: 20)

        ])
    }

    private func setupHeadLineSourceLabelConstraints() {
        NSLayoutConstraint.activate([
            self.headLineSourceLabel.leadingAnchor.constraint(equalTo: self.headLineTitleLabel.leadingAnchor),
            self.headLineSourceLabel.centerYAnchor.constraint(equalTo: self.favouriteButton.centerYAnchor),
            self.headLineSourceLabel.heightAnchor.constraint(equalToConstant: 20),
            self.headLineDescriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.headlineImageView.trailingAnchor, constant: -60)

        ])
    }
}

extension HeadLinesCell: HeadLinesCellView {
    func setData(article: Article) {
        self.headlineImageView.image = nil
        if let imageUrlString = article.urlToImage {
            if let imageUrl = URL(string: imageUrlString) {
                self.headlineImageView.kf.indicatorType = .activity
                self.headlineImageView.kf.setImage(with: imageUrl)
            }
        }
        self.headLineTitleLabel.text = article.title ?? ""
        self.headLineDescriptionLabel.text = article.articleDescription ?? ""
        self.headLineDateLabel.text = article.publishedAt ?? ""
        self.headLineSourceLabel.text = "By: \(article.source?.name ?? "")"
    }

    @objc func didTappedFavButton() {
        print("Did Tapped Fav")
    }
}
