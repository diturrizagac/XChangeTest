//
//  ReusableIdentifier.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

protocol ReusableIdentifier {
    static var reusableIdentifier: String { get }
}

extension ReusableIdentifier {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableIdentifier { }
