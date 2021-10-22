import UIKit

public extension UIView {
    
    enum Equation {
        case less
        case more
    }
    
    enum Order {
        case front
        case back
    }
    
    enum Limits {
        case safeArea
        case margin
        case padding(CGFloat)
    }
    
}

