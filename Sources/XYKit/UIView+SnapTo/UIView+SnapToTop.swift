//
//  UIView+SnapToTop.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import UIKit

public extension UIView {

    // MARK: - Top constraints
    
    @discardableResult
    func top(snapTo anchorY: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = topAnchor.constraint(equalTo: anchorY)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func top(snapTo view: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = topAnchor.constraint(equalTo: view.topAnchor)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func top(snapTo limits: Limits) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            constraint = topAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.topAnchor)
            
        case .margin:
            let margin = directionalLayoutMargins.top
            
            if let superview = superview {
                constraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: margin)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to topAnchor + margin, returning an empty constraint")
                return NSLayoutConstraint()
            }
            
        case .padding(let padding):
            if let superview = superview {
                constraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: padding)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to topAnchor + padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }

}
