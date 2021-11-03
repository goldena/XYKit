//
//  UIView+Tappable.swift
//
//  Created by Denis Goloborodko on 15.10.21.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func tappable(with selector: Selector) -> UIView {
        isUserInteractionEnabled = true

        let tap = UITapGestureRecognizer(target: rootSuperview, action: selector)
        addGestureRecognizer(tap)

        return self
    }
    
}
