//
//  UILabel+ConvenienceInit.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UILabel {
    
    convenience init(text: String? = nil, font: UIFont? = nil) {
        self.init()

        self.text = text
        self.font = font
    }
    
}
