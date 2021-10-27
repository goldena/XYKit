//
//  UIView+Center.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

// MARK: - Centering in a superview with an optional offset

public extension UIView {
    
    // MARK: - Center horizontally
    
    @discardableResult
    func centerX(snapTo view: UIView? = nil) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        var constraint: NSLayoutConstraint
        
        if let view = view {
            constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor)
        } else {
            if let superview = superview {
                constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            } else {
                print("View \(String(describing: self)) has no superview to be centered horizontally in")
                
                return NSLayoutConstraint()
            }
        }
            
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerX(snapTo anchorX: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = centerXAnchor.constraint(equalTo: anchorX)
        
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Center vertically
    
    @discardableResult
    func centerY(snapTo view: UIView? = nil) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        var constraint: NSLayoutConstraint
        
        if let view = view {
            constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor)
        } else {
            if let superview = superview {
                constraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            } else {
                print("View \(String(describing: self)) has no superview to be centered vertically in")
                
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerY(snapTo anchorY: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = centerYAnchor.constraint(equalTo: anchorY)
        
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Center horizontally and vertically
    
    @discardableResult
    func centerXY() -> [NSLayoutConstraint] {
        [centerX(), centerY()]
    }
    
    @discardableResult
    func centerXY(snapTo view: UIView) -> [NSLayoutConstraint] {
        [centerX(snapTo: view), centerY(snapTo: view)]
    }
    
}
