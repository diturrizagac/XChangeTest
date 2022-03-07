//
//  UITextField+Extension.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 2/03/22.
//

import UIKit

extension UITextField {

    func applyDefaultDesign() {
        textAlignment = .center
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
        layer.masksToBounds = true
        clipsToBounds = true
        heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
