import UIKit

public extension UIView {
    
    @discardableResult
    func orderZ(_ order: Order) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        guard let superview = superview else {
            print("View \(String(describing: self)) has no superview to change its order in")
            
            return self
        }
        
        switch order {
        case .front:
            superview.bringSubviewToFront(self)
            
        case .back:
            superview.sendSubviewToBack(self)
            
        case .above(let view):
            superview.insertSubview(self, aboveSubview: view)
            
        case .below(let view):
            superview.insertSubview(self, belowSubview: view)
        }
            
        return self
    }
    
}
