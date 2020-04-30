import UIKit


public typealias Constraint = NSLayoutConstraint
public typealias Constraints = [Constraint]

public extension Collection where Iterator.Element == Constraint {
    
    func activate() {
        
        if let constraints = self as? Constraints {
            Constraint.activate(constraints)
        }
    }
    
    func deActivate() {
        
        if let constraints = self as? Constraints {
            Constraint.deactivate(constraints)
        }
    }
}

public extension Constraint {
    
    func with(_ p: UILayoutPriority) -> Self {
        priority = p
        return self
    }
}
