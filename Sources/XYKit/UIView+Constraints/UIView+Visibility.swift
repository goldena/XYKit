//
//  UIView+Visibility.swift
//
//  Created by Denis Goloborodko on 22.10.21.
//

import UIKit

extension UIView {
    
    @discardableResult
    func hide() -> UIView {
        isHidden = true
        
        return self
    }

    @discardableResult
    func show() -> UIView {
        isHidden = false
        
        return self
    }
    
}
