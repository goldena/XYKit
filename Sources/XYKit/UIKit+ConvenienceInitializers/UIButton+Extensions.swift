//
//  UIButton+Extensions.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UIButton {
    
    convenience init(type: UIButton.ButtonType, title: String? = nil, font: UIFont? = nil) {
        self.init()
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
    }
    
}
