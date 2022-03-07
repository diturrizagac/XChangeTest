//
//  UITableView+Extension.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

extension UITableView {
    
    typealias ReusableCell = UITableViewCell
    
    func register<T: ReusableCell>(_ cellType: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: ReusableCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reusableIdentifier, for: indexPath) as? T else {
            fatalError("Should implement ReusableIdentifier protocol on cell")
        }
        return cell
    }
}
