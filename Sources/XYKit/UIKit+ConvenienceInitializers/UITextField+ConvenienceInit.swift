//
//  UITextField+ConvenienceInit.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UITextField {
    
    convenience init(placeholder: String? = nil, font: UIFont? = nil) {
        self.init()

        self.placeholder = placeholder
        self.font = font
    }
    
}
