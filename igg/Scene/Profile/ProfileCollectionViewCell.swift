//
//  ProfileCollectionViewCell.swift
//  igg
//
//  Created by 황지웅 on 2022/09/19.
//

import Foundation
import UIKit
import SnapKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private let imageView = UIImageView()

    func setup(with image: UIImage) {
        addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }

        imageView.backgroundColor = .tertiaryLabel
    }
}

