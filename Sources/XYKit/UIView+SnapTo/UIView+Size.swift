//
//  UIView+Size.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UIView {
    
    // MARK: - Width constraints
    
    @discardableResult
    func width(_ constant: CGFloat, or equation: Equation? = nil) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraintX: NSLayoutConstraint
        
        if let equation = equation {
            switch equation {
            case .less:
                constraintX = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
                
            case .more:
                constraintX = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        } else {
            constraintX = widthAnchor.constraint(equalToConstant: constant)
        }
        
        constraintX.isActive = true
        return constraintX
    }
    
    @discardableResult
    func width(snapTo width: NSLayoutDimension, or equation: Equation? = nil, ratio: CGFloat = 1.0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraintX: NSLayoutConstraint
        
        if let equation = equation {
            switch equation {
            case .less:
                constraintX = widthAnchor.constraint(lessThanOrEqualTo: width, multiplier: ratio)
                
            case .more:
                constraintX = widthAnchor.constraint(greaterThanOrEqualTo: width, multiplier: ratio)
            }
        } else {
            constraintX = widthAnchor.constraint(equalTo: width, multiplier: ratio)
        }
        
        constraintX.isActive = true
        return constraintX
    }
    
    @discardableResult
    func width(snapTo view: UIView, or equation: Equation? = nil, ratio: CGFloat = 1.0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraintX: NSLayoutConstraint
        
        if let equation = equation {
            switch equation {
            case .less:
                constraintX = widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: ratio)
                
            case .more:
                constraintX = widthAnchor.constraint(greaterThanOrEqualTo: view.widthAnchor, multiplier: ratio)
            }
        } else {
            constraintX = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio)
        }
        
        constraintX.isActive = true
        return constraintX
    }

    func width(snapTo limits: Limits) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            constraint = widthAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.widthAnchor)
            
        case .margin:
            let margin = directionalLayoutMargins.leading + directionalLayoutMargins.trailing
            
            if let superview = superview {
                constraint = widthAnchor.constraint(equalTo: superview.widthAnchor, constant: -margin)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to its width - margin, returning an empty constraint")
                return NSLayoutConstraint()
            }
            
        case .padding(let padding):
            if let superview = superview {
                constraint = widthAnchor.constraint(equalTo: superview.widthAnchor, constant: -padding * 2)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to its width - padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Height constraints
    
    @discardableResult
    func height(_ constant: CGFloat, or equation: Equation? = nil) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraintY: NSLayoutConstraint
        
        if let equation = equation {
            switch equation {
            case .less:
                constraintY = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
                
            case .more:
                constraintY = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        } else {
            constraintY = heightAnchor.constraint(equalToConstant: constant)
        }
        
        constraintY.isActive = true
        return constraintY
    }
    
    @discardableResult
    func height(snapTo height: NSLayoutDimension, or equation: Equation? = nil, ratio: CGFloat = 1.0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraintY: NSLayoutConstraint
        
        if let equation = equation {
            switch equation {
            case .less:
                constraintY = heightAnchor.constraint(lessThanOrEqualTo: height, multiplier: ratio)
                
            case .more:
                constraintY = heightAnchor.constraint(greaterThanOrEqualTo: height, multiplier: ratio)
            }
        } else {
            constraintY = heightAnchor.constraint(equalTo: height, multiplier: ratio)
        }
        
        constraintY.isActive = true
        return constraintY
    }
    
    @discardableResult
    func height(snapTo view: UIView, or equation: Equation? = nil, ratio: CGFloat = 1.0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraintY: NSLayoutConstraint
        
        if let equation = equation {
            switch equation {
            case .less:
                constraintY = heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, multiplier: ratio)
                
            case .more:
                constraintY = heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: ratio)
            }
        } else {
            constraintY = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: ratio)
        }
        
        constraintY.isActive = true
        return constraintY
    }

    @discardableResult
    func height(snapTo limits: Limits) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint: NSLayoutConstraint
        
        switch limits {
        case .safeArea:
            constraint = heightAnchor.constraint(equalTo: rootSuperview.safeAreaLayoutGuide.heightAnchor)
            
        case .margin:
            let margin = directionalLayoutMargins.top + directionalLayoutMargins.bottom
            
            if let superview = superview {
                constraint = heightAnchor.constraint(equalTo: superview.heightAnchor, constant: -margin)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to its height - margin, returning an empty constraint")
                return NSLayoutConstraint()
            }
            
        case .padding(let padding):
            if let superview = superview {
                constraint = heightAnchor.constraint(equalTo: superview.heightAnchor, constant: -padding * 2)
            } else {
                print("View \(String(describing: self)) has no superview to be snapped to its height - padding, returning an empty constraint")
                return NSLayoutConstraint()
            }
        }
        
        constraint.isActive = true
        return constraint
    }
    
    // MARK: - Size constraints
    
    @discardableResult
    func size(width: CGFloat, height: CGFloat, or equation: Equation? = nil) -> [NSLayoutConstraint] {
        [self.width(width, or: equation), self.height(height, or: equation)]
    }
    
    @discardableResult
    func size(snapTo view: UIView, or equation: Equation? = nil, ratio: CGFloat = 1.0) -> [NSLayoutConstraint] {
        [self.width(snapTo: view, or: equation, ratio: ratio), self.height(snapTo: view, or: equation, ratio: ratio)]
    }
    
    @discardableResult
    func size(snapTo limits: Limits) -> [NSLayoutConstraint] {
        [self.width(snapTo: limits), self.height(snapTo: limits)]
    }
    
}

