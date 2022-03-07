//
//  UIButton+Extension.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 2/03/22.
//

import UIKit

extension UIButton {
    
    func applyButtonDesign() {
        tintColor = .white
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        clipsToBounds = true
    }
    
    func applyTextDesign() {
        setTitleColor(.systemBlue, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        heightAnchor.constraint(equalToConstant: 10).isActive = true
        backgroundColor = .clear
    }
}
