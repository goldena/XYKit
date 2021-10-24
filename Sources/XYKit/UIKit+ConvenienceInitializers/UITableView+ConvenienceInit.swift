//
//  UITableView+Extension.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UITableView {
    
    convenience init(CellClass: AnyClass? = nil, cellReuseIdentifier: String? = nil) {
        self.init()

        if CellClass != nil,
           let identifier = cellReuseIdentifier {
            self.register(CellClass, forCellReuseIdentifier: identifier)
        }
    }
    
}
