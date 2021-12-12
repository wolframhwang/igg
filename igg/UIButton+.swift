//
//  UIButton+.swift
//  igg
//
//  Created by 황지웅 on 2021/12/13.
//

import Foundation
import UIKit

extension UIButton {
    func setImage(systemName: String) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = .zero
        
        setImage(UIImage(systemName: systemName), for: .normal)
    }
}
