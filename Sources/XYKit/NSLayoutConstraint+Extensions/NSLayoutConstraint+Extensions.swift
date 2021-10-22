//
//  NSLayoutConstraint+Extensions.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension NSLayoutConstraint {
    
    @discardableResult
    func activate() -> NSLayoutConstraint {
        isActive = true

        return self
    }
    
    @discardableResult
    func deactivate() -> NSLayoutConstraint {
        isActive = false

        return self
    }
    
    @discardableResult
    func offset(_ offset: CGFloat) -> NSLayoutConstraint {
        self.constant = offset

        return self
    }
    
    @discardableResult
    func priority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        
        return self
    }
    
    @discardableResult
    func id(_ identifier: String) -> NSLayoutConstraint {
        self.identifier = identifier
        
        return self
    }
    
}
