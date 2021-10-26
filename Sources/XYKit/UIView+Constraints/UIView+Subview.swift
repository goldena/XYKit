//
//  UIView+subview.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

// MARK: - Size constraints

public extension UIView {
    
    @discardableResult
    func superview(is view: UIView) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        guard view !== self else {
            print("!! \(String(describing: self)) cannot become a subview of itself")
            return self
        }
        
        guard view !== superview else {
            print("!! \(String(describing: self)) is already a subview of \(String(describing: view))")
            return self
        }
        
#if DEBUG
        print("-! \(String(describing: self)) was moved from \(String(describing: superview)) to \(String(describing:view))")
#endif
        
        guard let stackView = view as? UIStackView else {
            view.addSubview(self)
            return self
        }
        
        removeFromSuperview()
        stackView.addArrangedSubview(self)
            
        return self
    }
    
    @discardableResult
    func subview(is view: UIView) -> UIView {
        view.superview(is: self)
        
        return self
    }
    
    @discardableResult
    func subviews(are views: UIView...) -> UIView {
        views.forEach { view in
            view.superview(is: self)
        }
        
        return self
    }
    
    @discardableResult
    func subviews(are views: [UIView]) -> UIView {
        views.forEach { view in
            view.superview(is: self)
        }
        
        return self
    }
    
    @discardableResult
    func atIndex(_ index: Int) -> UIView {
        guard let stackView = superview as? UIStackView else {
            print("!! - \(String(describing: superview)) - superview of \(String(describing: self)) is not a StackView")
            
            return self
        }
        
        if (0..<stackView.subviews.count).contains(index) {
            stackView.insertArrangedSubview(self, at: index)
        } else {
            print("!! - Trying to insert an arranged subview \(String(describing: self)) at invalid index \(index) into \(String(describing: stackView)), with arranged subviews count \(stackView.subviews.count)")
        }
        
        return self
    }
    
}
