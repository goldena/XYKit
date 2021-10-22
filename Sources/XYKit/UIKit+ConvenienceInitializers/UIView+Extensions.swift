import UIKit

public extension UIView {
    
    convenience init(backgroundColor: UIColor? = nil) {
        self.init()

        self.backgroundColor = backgroundColor
    }
    
}
