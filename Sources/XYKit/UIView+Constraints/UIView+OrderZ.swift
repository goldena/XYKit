import UIKit

public extension UIView {

    @discardableResult
    func orderZ(to order: Order) -> UIView{
        translatesAutoresizingMaskIntoConstraints = false

        guard let superview = superview else {
            print("View \(String(describing: self)) has no superview to to change Z order in")
            
            return self
        }
        
        switch order {
        case .front:
            superview.bringSubviewToFront(self)
        case .back:
            superview.sendSubviewToBack(self)
        }
        
        return self
    }
    
}
