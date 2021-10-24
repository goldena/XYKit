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
    
#warning("Should be tested")
    static func printConstraint(_ constraint: NSLayoutConstraint) {
        print("1-1. First Item:     \(String(describing: constraint.firstItem))")
        print("1-2. Second Item:    \(String(describing: constraint.secondItem))")
        
        print("2-1. First Anchor:   \(constraint.firstAnchor)")
        print("2-1. Second Anchor:  \(String(describing: constraint.secondAnchor))")
        
        print("3-1. First Attribute:    \(constraint.firstAttribute.rawValue)")
        print("3-1. Second Attribute:   \(constraint.secondAttribute.rawValue)")
        
        print("4. relation:     \(constraint.relation.rawValue)")
        
        print("5. Multiplier:   \(constraint.multiplier)")
        print("6. Constant:     \(constraint.constant)")
        print("7. isActive:     \(constraint.isActive)")
        
        print("8. identifier:   \(String(describing: constraint.identifier))")
    }
    
    #warning("Should be tested")
    func isTheSameConstraint(as constraint: NSLayoutConstraint) -> Bool {
        guard firstItem?.description == constraint.firstItem?.description,
              secondItem?.description == constraint.secondItem?.description,
              firstAnchor == constraint.firstAnchor,
              secondAnchor == constraint.secondAnchor,
              firstAttribute == constraint.firstAttribute,
              secondAttribute == constraint.secondAttribute,
              relation == constraint.relation,
              multiplier == constraint.multiplier,
              constant == constraint.constant,
              isActive == constraint.isActive else {
                  return false
              }
        
        return true
    }
    
}
