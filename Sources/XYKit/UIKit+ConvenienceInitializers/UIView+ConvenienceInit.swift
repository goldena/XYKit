//
//  UITView+ConvenienceInit.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UIView {
    
    convenience init(backgroundColor: UIColor? = nil) {
        self.init()

        self.backgroundColor = backgroundColor
    }
    
}
