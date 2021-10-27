//
//  UIStackView+ConvenienceInit.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis = .horizontal, distribution: UIStackView.Distribution = .equalCentering) {
        self.init()

        self.axis = axis
        self.distribution = distribution
    }
    
}
