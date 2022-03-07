//
//  AlertHelper.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

struct AlertHelper {
    static func present(in parent: UIViewController,
                        title: String,
                        message: String,
                        style: UIAlertController.Style = .alert,
                        actionTitle: String? = "Right",
                        actionStyle: UIAlertAction.Style = .default,
                        handler: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: actionTitle, style: actionStyle) { _ in
            handler?()
        }
        alertController.addAction(okAction)
        
        parent.present(alertController, animated: true, completion: nil)
    }
}

protocol ErrorHandler {
    func handleError(title: String, message: String)
}

extension ErrorHandler where Self: UIViewController {
    func handleError(title: String, message: String) {
        AlertHelper.present(in: self, title: title, message: message)
    }
}
