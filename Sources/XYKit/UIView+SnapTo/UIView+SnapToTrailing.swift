//
//  UIView+SnapToTrailing.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import UIKit

public extension UIView {
    
    // MARK: - Trailing Constraints
    
    @discardableResult
    func trailing(snapTo anchorX: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = trailingAnchor.constraint(equalTo: anchorX)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func trailing(snapTo view: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func trailing(snapTo limits: Limits) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            constraint = trailingAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.trailingAnchor)
            
        case .margin:
            let margins = directionalLayoutMargins.trailing
            
            if let superview = superview {
                constraint = trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -margins)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to trailingAnchor, returning an empty constraint")
                return NSLayoutConstraint()
            }
                
        case .padding(let padding):
            if let superview = superview {
                constraint = trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to trailingAnchor - padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }

}
