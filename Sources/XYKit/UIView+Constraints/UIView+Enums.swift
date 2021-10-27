//
//  UIView+Enums.swift
//
//  Created by Denis Goloborodko on 7.10.21.
//

import UIKit

public extension UIView {
    
    enum Equation {
        case less
        case more
    }
    
    enum Order {
        case front
        case above(_ view: UIView)
        case below(_ view: UIView)
        case back
    }
    
    enum Limits {
        case safeArea
        case margin
        case padding(CGFloat)
    }
    
}

