//
//  UIView+Anchors.swift
//
//  Created by Denis Goloborodko on 22.10.21.
//

import UIKit

public extension UIView {
    
    var leading: NSLayoutXAxisAnchor { leadingAnchor }
    
    var top: NSLayoutYAxisAnchor { topAnchor }
    
    var trailing: NSLayoutXAxisAnchor { trailingAnchor }
    
    var bottom: NSLayoutYAxisAnchor { bottomAnchor }

    var centerX: NSLayoutXAxisAnchor { centerXAnchor }

    var centerY: NSLayoutYAxisAnchor { centerYAnchor }
    
    var width: NSLayoutDimension { widthAnchor }
    
    var height: NSLayoutDimension { heightAnchor }
    
    var left: NSLayoutXAxisAnchor { leftAnchor }
    
    var right: NSLayoutXAxisAnchor { rightAnchor }
    
    var firstBaseline: NSLayoutYAxisAnchor { firstBaselineAnchor }
    
    var lastBaseline: NSLayoutYAxisAnchor { lastBaselineAnchor }
    
}
