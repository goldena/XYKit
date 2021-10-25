//
//  UIView+SnapToRight.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import UIKit

public extension UIView {
    
    // MARK: - Right Constraint
    
    @discardableResult
    func right(snapTo anchorX: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
                
        let constraint = rightAnchor.constraint(equalTo: anchorX)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func right(snapTo view: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = rightAnchor.constraint(equalTo: view.rightAnchor)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func right(snapTo limits: Limits) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            constraint = rightAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.rightAnchor)
            
        case .margin:
            if let superview = superview {
                let margin = directionalLayoutMargins.leading
                constraint = rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -margin)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to leadingAnchor, returning an empty constraint")
                return NSLayoutConstraint()
            }
            
        case .padding(let padding):
            if let superview = superview {
                constraint = rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -padding)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to leadingAnchor + padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }
    
}
