//
//  UIView+Tappable.swift
//
//  Created by Denis Goloborodko on 15.10.21.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func tappable(with tapRecognizer: UITapGestureRecognizer) -> UIView {
        isUserInteractionEnabled = true

        addGestureRecognizer(tapRecognizer)

        return self
    }
        
}
