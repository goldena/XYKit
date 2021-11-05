//
//  UIView+Resistance&Hugging.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

// MARK: - Setting compression resistance

public extension UIView {
    
    var resistanceX: UILayoutPriority {
        get { contentCompressionResistancePriority(for: .horizontal) }
        set { setContentCompressionResistancePriority(newValue, for: .horizontal) }
    }
    
    var resistanceY: UILayoutPriority {
        get { contentCompressionResistancePriority(for: .vertical) }
        set { setContentCompressionResistancePriority(newValue, for: .vertical) }
    }
    
    var huggingX: UILayoutPriority {
        get { contentHuggingPriority(for: .horizontal) }
        set { setContentCompressionResistancePriority(newValue, for: .horizontal) }
    }
    
    var huggingY: UILayoutPriority {
        get { contentHuggingPriority(for: .vertical) }
        set { setContentCompressionResistancePriority(newValue, for: .vertical) }
    }
    
}

public extension UIView {
    
    @discardableResult
    func resistanceX(_ priority: UILayoutPriority) -> UIView {
        setContentCompressionResistancePriority(priority, for: .horizontal)
        
        return self
    }
    
    @discardableResult
    func resistanceY(_ priority: UILayoutPriority) -> UIView {
        setContentCompressionResistancePriority(priority, for: .vertical)
        
        return self
    }
    
    @discardableResult
    func resistanceXY(_ priority: UILayoutPriority) -> UIView {
        resistanceX(priority).resistanceY(priority)
        
        return self
    }
    
}

// MARK: - Setting content hugging

public extension UIView {
    
    @discardableResult
    func huggingX(_ priority: UILayoutPriority) -> UIView {
        setContentHuggingPriority(priority, for: .horizontal)
        
        return self
    }
    
    @discardableResult
    func huggingY(_ priority: UILayoutPriority) -> UIView {
        setContentHuggingPriority(priority, for: .vertical)
        
        return self
    }
    
    @discardableResult
    func huggingXY(_ priority: UILayoutPriority) -> UIView {
        huggingX(priority).huggingY(priority)
        
        return self
    }
    
}
