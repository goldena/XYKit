//
//  UIView+SnapToLastBaseline.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import UIKit

public extension UIView {
    
    // MARK: - LastBaseline constraints
    
    @discardableResult
    func lastBaseline(snapTo anchorY: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        let constraint = lastBaselineAnchor.constraint(equalTo: anchorY)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func lastBaseline(snapTo view: UIView) -> NSLayoutConstraint {
        let constraint = lastBaselineAnchor.constraint(equalTo: view.lastBaselineAnchor)
        
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func lastBaseline(snapTo limits: Limits) -> NSLayoutConstraint {
        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            constraint = lastBaselineAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.bottomAnchor)
            
        case .margin:
            let margin = directionalLayoutMargins.bottom
            
            if let superview = superview {
                constraint = lastBaselineAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margin)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to lastBaselineAnchor - margin, returning an empty constraint")
                return NSLayoutConstraint()
            }
            
        case .padding(let padding):
            if let superview = superview {
                constraint = lastBaseline.constraint(equalTo: superview.bottomAnchor, constant: -padding)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to lastBaselineAnchor - padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }

}
