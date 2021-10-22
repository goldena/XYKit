//
//  UIView+AddTagGestureRecognizer.swift
//  XYKit
//
//  Created by Denis Goloborodko on 15.10.21.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func tappable(with tapRecognizer: UITapGestureRecognizer) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        isUserInteractionEnabled = true

        addGestureRecognizer(tapRecognizer)

        return self
    }
        
}
