//
//  UIView+PrintConstraints.swift
//
//  Created by Denis Goloborodko on 13.10.21.
//

import UIKit

extension UIView {
    
    func printConstraints() {
#if DEBUG
        print(" -- Constraints of a \(self)")
        
        for constraint in constraints {
            print(" -> \(constraint)")
        }
        
        print(" == Number of constraints: \(constraints.count)")
#endif
    }
    
}
