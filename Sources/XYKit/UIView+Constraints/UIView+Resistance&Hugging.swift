//
//  UIView+Resistance&Hugging.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

// MARK: - Setting compression resistance

public extension UIView {
    
    @discardableResult
    func resistanceX(_ priority: UILayoutPriority) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        setContentCompressionResistancePriority(priority, for: .horizontal)
        
        return self
    }
    
    @discardableResult
    func resistanceY(_ priority: UILayoutPriority) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        setContentCompressionResistancePriority(priority, for: .vertical)
        
        return self
    }
    
    @discardableResult
    func resistanceXY(_ priority: UILayoutPriority) -> UIView {
        resistanceX(priority).resistanceY(priority)
    }
    
}

// MARK: - Setting content hugging

public extension UIView {
    
    @discardableResult
    func huggingX(_ priority: UILayoutPriority) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        setContentHuggingPriority(priority, for: .horizontal)
        
        return self
    }
    
    @discardableResult
    func huggingY(_ priority: UILayoutPriority) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        setContentHuggingPriority(priority, for: .vertical)
        
        return self
    }
    
    @discardableResult
    func huggingXY(_ priority: UILayoutPriority) -> UIView {
        huggingX(priority).huggingY(priority)
    }
    
}
