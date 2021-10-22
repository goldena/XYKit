//
//  UIKit+SizeClass.swift
//  XYKit
//
//  Created by Denis Goloborodko on 15.10.21.
//

import UIKit

public extension UIView {

    var isCompactWidth: Bool {
        traitCollection.horizontalSizeClass == .compact
    }

    var isRegularWidth: Bool {
        traitCollection.horizontalSizeClass == .regular
    }
    
    var isCompactHeight: Bool {
        traitCollection.verticalSizeClass == .compact
    }

    var isRegularHeight: Bool {
        traitCollection.verticalSizeClass == .regular
    }
    
}
