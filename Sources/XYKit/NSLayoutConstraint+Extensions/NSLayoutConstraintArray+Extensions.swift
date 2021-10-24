//
//  NSLayoutConstraintArray+Extensions.swift
//  XYKit
//
//  Created by Denis Goloborodko on 15.10.21.
//

import UIKit

public extension Array where Element: NSLayoutConstraint {
    
    @discardableResult
    func activate() -> [NSLayoutConstraint] {
        NSLayoutConstraint.activate(self)
        
        return self
    }
    
    @discardableResult
    func deactivate() -> [NSLayoutConstraint] {
        NSLayoutConstraint.deactivate(self)
        
        return self
    }
    
}
