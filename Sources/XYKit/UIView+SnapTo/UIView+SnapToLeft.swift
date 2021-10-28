//
//  UIView+SnapToLeft.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import UIKit

public extension UIView {
    
    // MARK: - Left Constraint
    
    @discardableResult
    func left(snapTo anchorX: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: anchorX)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func left(snapTo view: UIView) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: view.leftAnchor)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func left(snapTo limits: Limits) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            constraint = leftAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.leftAnchor)
            
        case .margin:
            if let superview = superview {
                let margin = directionalLayoutMargins.leading
                constraint = leftAnchor.constraint(equalTo: superview.leftAnchor, constant: margin)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to leadingAnchor, returning an empty constraint")
                return NSLayoutConstraint()
            }
            
        case .padding(let padding):
            if let superview = superview {
                constraint = leftAnchor.constraint(equalTo: superview.leftAnchor, constant: padding)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to leadingAnchor + padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }
    
}
