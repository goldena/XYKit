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
            #warning("Not sure about that one yet")
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
    
    // MARK: - LastBaseline constraints
    
    @discardableResult
    func lastBaseline(snapTo anchorY: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = lastBaselineAnchor.constraint(equalTo: anchorY)
        
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func lastBaseline(snapTo view: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = lastBaselineAnchor.constraint(equalTo: view.lastBaselineAnchor)
        
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func lastBaseline(snapTo limits: Limits) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false

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
    
    // MARK: - SidesX (Horizontally)
    
    @discardableResult
    func sidesX(snapTo view: UIView) -> [NSLayoutConstraint] {
        [leading(snapTo: view), trailing(snapTo: view)]
    }

    @discardableResult
    func sidesX(snapTo limits: Limits) -> [NSLayoutConstraint] {
        [leading(snapTo: limits), trailing(snapTo: limits)]
    }

    // MARK: - SidesY (Vertically)
    
    @discardableResult
    func sidesY(snapTo view: UIView) -> [NSLayoutConstraint] {
        [top(snapTo: view), bottom(snapTo: view)]
    }

    @discardableResult
    func sidesY(snapTo limits: Limits) -> [NSLayoutConstraint] {
        [top(snapTo: limits), bottom(snapTo: limits)]
    }

    // MARK: - AllSides
    
    @discardableResult
    func sides(snapTo view: UIView) -> [NSLayoutConstraint] {
        [leading(snapTo: view), top(snapTo: view), trailing(snapTo: view), bottom(snapTo: view)]
    }

    @discardableResult
    func sides(snapTo limits: Limits) -> [NSLayoutConstraint] {
        [leading(snapTo: limits), top(snapTo: limits), trailing(snapTo: limits), bottom(snapTo: limits)]
    }
    
}

