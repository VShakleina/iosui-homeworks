//
//  Extensions.swift
//  Navigation
//
//  Created by Viktoriia Shakleina on 10.04.2022.
//

import UIKit

extension UIResponder {
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        self.next as? T ?? self.next?.next(type)
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return next(UITableView.self)
    }

    var indexPath: IndexPath? {
        return tableView?.indexPathForRow(at: self.center)
    }
}
