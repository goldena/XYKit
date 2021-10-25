//
//  UIView+SnapToLeading.swift
//
//
//  Created by Denis Goloborodko on 25.10.21.
//

import UIKit

public extension UIView {
    
    // MARK: - Leading Constraint
    
    @discardableResult
    func leading(snapTo anchorX: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
                
        let constraint = leadingAnchor.constraint(equalTo: anchorX)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func leading(snapTo view: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = leadingAnchor.constraint(equalTo: view.leadingAnchor)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func leading(snapTo limits: Limits) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            constraint = leadingAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.leadingAnchor)
            
        case .margin:
            if let superview = superview {
                let margin = directionalLayoutMargins.leading
                constraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margin)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to leadingAnchor, returning an empty constraint")
                return NSLayoutConstraint()
            }
            
        case .padding(let padding):
            if let superview = superview {
                constraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to leadingAnchor + padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }
    
}

