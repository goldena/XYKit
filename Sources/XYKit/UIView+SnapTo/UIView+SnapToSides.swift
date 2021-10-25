//
//  UIView+SnapToSides.swift
//  
//
//  Created by Denis Goloborodko on 25.10.21.
//

import UIKit

public extension UIView {
    
    // MARK: - SidesX (Horizontally)
    
    @discardableResult
    func sidesX(snapTo view: UIView) -> [NSLayoutConstraint] {
        [leading(snapTo: view), trailing(snapTo: view)]
    }

    @discardableResult
    func sidesX(snapTo limits: Limits) -> [NSLayoutConstraint] {
        [leading(snapTo: limits), trailing(snapTo: limits)]
    }

    // MARK: - SidesY (Vertically)
    
    @discardableResult
    func sidesY(snapTo view: UIView) -> [NSLayoutConstraint] {
        [top(snapTo: view), bottom(snapTo: view)]
    }

    @discardableResult
    func sidesY(snapTo limits: Limits) -> [NSLayoutConstraint] {
        [top(snapTo: limits), bottom(snapTo: limits)]
    }

    // MARK: - AllSides
    
    @discardableResult
    func sides(snapTo view: UIView) -> [NSLayoutConstraint] {
        [leading(snapTo: view), top(snapTo: view), trailing(snapTo: view), bottom(snapTo: view)]
    }

    @discardableResult
    func sides(snapTo limits: Limits) -> [NSLayoutConstraint] {
        [leading(snapTo: limits), top(snapTo: limits), trailing(snapTo: limits), bottom(snapTo: limits)]
    }

}
