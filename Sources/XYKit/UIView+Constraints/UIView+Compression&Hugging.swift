//
//  UIView+Compression&Hugging.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 7.10.21.
//

import UIKit

public extension UIView {
    
    var compressionX: UILayoutPriority {
        get {
            contentCompressionResistancePriority(for: .horizontal)
        }
        set {
            translatesAutoresizingMaskIntoConstraints = false
            
            setContentCompressionResistancePriority(newValue, for: .horizontal)
        }
    }
    
    var compressionY: UILayoutPriority {
        get {
            contentCompressionResistancePriority(for: .vertical)
        }
        set {
            translatesAutoresizingMaskIntoConstraints = false

            setContentCompressionResistancePriority(newValue, for: .vertical)
        }
    }

    var huggingX: UILayoutPriority {
        get {
            contentHuggingPriority(for: .horizontal)
        }
        set {
            translatesAutoresizingMaskIntoConstraints = false

            setContentCompressionResistancePriority(newValue, for: .horizontal)
        }
    }
    
    var huggingY: UILayoutPriority {
        get {
            contentHuggingPriority(for: .vertical)
        }
        set {
            translatesAutoresizingMaskIntoConstraints = false

            setContentCompressionResistancePriority(newValue, for: .vertical)
        }
    }
    
}
