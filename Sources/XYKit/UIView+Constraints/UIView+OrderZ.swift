import UIKit

public extension UIView {
    
    @discardableResult
    func orderZ(snapTo order: Order) -> UIView {
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
            
        case .over(let view):
            guard let indexOfSelf = superview.indexOfSubview(self),
                  let indexOfView = superview.indexOfSubview(view) else {
                print("!! \(String(describing: view)) has a superview other than \(String(describing: self))")
                      
                return self
            }
            
            guard indexOfSelf != indexOfView else {
                print("!! Trying to change the order of views on self \(String(describing: self))")
                
                return self
            }
            
            guard indexOfSelf < indexOfView else {
                print("!! The \(String(describing: self)) is already above \(String(describing: view))")
                
                return self
            }

            #warning("What about constraints???")
            
            superview.subviews.remove(at: indexOfSelf)
            superview.subviews.insert(self, at: indexOfView)
            
        case .under(let view):
        case .over(let view):
            guard let indexOfSelf = superview.indexOfSubview(self),
                  let indexOfView = superview.indexOfSubview(view) else {
                print("!! \(String(describing: view)) has a superview other than \(String(describing: self))")
                      
                return self
            }
            
            guard indexOfSelf != indexOfView else {
                print("!! Trying to change the order of views on self \(String(describing: self))")
                
                return self
            }
            
            guard indexOfSelf > indexOfView else {
                print("!! The \(String(describing: self)) is already under \(String(describing: view))")
                
                return self
            }

            #warning("What about constraints???")
            
            superview.subviews.remove(at: indexOfSelf)
            superview.subviews.insert(self, at: indexOfView)

        return self
    }
    
}
