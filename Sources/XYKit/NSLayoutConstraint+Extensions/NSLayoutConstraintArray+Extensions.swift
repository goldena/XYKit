//
//  NSLayoutConstraintArray+Extensions.swift
//  XYKit
//
//  Created by Denis Goloborodko on 15.10.21.
//

import UIKit

public extension Array where Element: NSLayoutConstraint {
    
    func activate() {
        NSLayoutConstraint.activate(self)
    }
    
    func deactivate() {
        NSLayoutConstraint.deactivate(self)
    }
    
}
