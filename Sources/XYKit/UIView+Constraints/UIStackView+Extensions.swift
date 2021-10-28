//
//  UIStackView+Extensions.swift
//
//  Created by Denis Goloborodko on 14.10.21.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func insets(_ allSides: CGFloat) -> UIView {
        guard let stackView = self as? UIStackView else {
            print("!! \(String(describing: self)) is not a StackView, no changes done")
            return self
        }
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: allSides, left: allSides, bottom: allSides, right: allSides)
        
        return stackView
    }
    
    @discardableResult
    func insets(_ insets: UIEdgeInsets) -> UIView {
        guard let stackView = self as? UIStackView else {
            print("!! \(String(describing: self)) is not a StackView, no changes done")
            return self
        }
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = insets
        
        return stackView
    }
    
    @discardableResult
    func insets(left: CGFloat = 0, top: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) -> UIView {
        guard let stackView = self as? UIStackView else {
            print("!! \(String(describing: self)) is not a StackView, no changes done")
            return self
        }
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        
        return stackView
    }
        
    @discardableResult
    func spacing(_ spacing: CGFloat) -> UIView {
        guard let stackView = self as? UIStackView else {
            print("!! \(String(describing: self)) is not a StackView, no changes done")
            return self
        }
        
        stackView.spacing = spacing
        
        return stackView
    }
    
}
