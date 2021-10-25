//
//  UIView+SnapToBottom.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import UIKit

public extension UIView {
    
    // MARK: - Bottom constraints
    
    @discardableResult
    func bottom(snapTo anchorY: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = bottomAnchor.constraint(equalTo: anchorY)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func bottom(snapTo view: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottom(snapTo limits: Limits) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            constraint = bottomAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.bottomAnchor)
            
        case .margin:
            let margin = directionalLayoutMargins.bottom
            
            if let superview = superview {
                constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -margin)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to bottomAnchor - margin, returning an empty constraint")
                return NSLayoutConstraint()
            }
            
        case .padding(let padding):
            if let superview = superview {
                constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to bottomAnchor - padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }

}
