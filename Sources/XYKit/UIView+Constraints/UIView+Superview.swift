//
//  UIView+Superview.swift
//  Do I own this game
//
//  Created by Denis Goloborodko on 13.10.21.
//

import UIKit

extension UIView {
    
    var rootSuperview: UIView {
        translatesAutoresizingMaskIntoConstraints = false

        var view = self
        
        while view.superview != nil {
            view = view.superview!
        }
        
        if view === self {
            print("View \(String(describing: self)) has no superview, returning self")
        }
        
        return view
    }
    
    #warning("test")
    func firstCommonSuperview(with view: UIView) -> UIView? {
        translatesAutoresizingMaskIntoConstraints = false

        var viewsHierarchy = [self]

        func nextSuperview(_ viewsHierarchy: [UIView]) -> UIView? {
            viewsHierarchy.last?.superview
        }
        
        while let superview = nextSuperview(viewsHierarchy) {
            viewsHierarchy.append(superview)
        }
        
        var view = view
        
        while view.superview != nil {
            if viewsHierarchy.first(where: { $0 === view }) != nil {
                return view
            }

            view = view.superview!
        }
        
        return nil
    }
    
}
