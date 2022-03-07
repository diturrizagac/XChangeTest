//
//  UIView+Extension.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

extension UIView {
    
    func dropShadow() {
        let color = UIColor(red: 0/250, green: 0/250, blue: 0/250, alpha: 0.5)
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
    }
}
