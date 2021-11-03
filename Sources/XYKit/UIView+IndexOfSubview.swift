//
//  UIView+IndexOfSubview.swift
//  
//  Created by Denis Goloborodko on 26.10.21.
//

import UIKit

extension UIView {

    func indexOfSubview(_ view: UIView) -> Int? {
        if let stackView = self as? UIStackView {
            return stackView.arrangedSubviews.firstIndex(of: view)
        }
        
        return subviews.firstIndex(of: view)
    }

}
