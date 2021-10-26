//
//  UIView+IndexOfSubview.swift
//  
//
//  Created by Denis Goloborodko on 26.10.21.
//

import UIKit

extension UIView {
    
    func indexOfSubview(_ view: UIView) -> Int? {
        subviews.firstIndex(of: view)
    }
    
}
