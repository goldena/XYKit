//
//  UIView+SnapToFirstBaseline.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import UIKit

public extension UIView {
    
    // MARK: - FirstBaseline constraints
    
    @discardableResult
    func firstBaseline(snapTo anchorY: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = firstBaselineAnchor.constraint(equalTo: anchorY)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func firstBaseline(snapTo view: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = firstBaselineAnchor.constraint(equalTo: view.firstBaselineAnchor)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func firstBaseline(snapTo limits: Limits) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            #warning("Not sure about this one")
            constraint = firstBaselineAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.topAnchor)
            
        case .margin:
            let margin = directionalLayoutMargins.top
            
            if let superview = superview {
                constraint = firstBaselineAnchor.constraint(equalTo: superview.topAnchor, constant: margin)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to firstBaselineAnchor + margin, returning an empty constraint")
                return NSLayoutConstraint()
            }
            
        case .padding(let padding):
            if let superview = superview {
                constraint = firstBaselineAnchor.constraint(equalTo: superview.topAnchor, constant: padding)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to firstBaselineAnchor + padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }

}
