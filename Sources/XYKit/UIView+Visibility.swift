//
//  UIView+Visibility.swift
//
//  Created by Denis Goloborodko on 22.10.21.
//

import UIKit

extension UIView {
    
    @discardableResult
    func hidden() -> UIView {
        isHidden = true
        
        return self
    }

    @discardableResult
    func visible() -> UIView {
        isHidden = false
        
        return self
    }
    
}
