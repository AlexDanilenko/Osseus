import UIKit

public extension UIView {
    
    @discardableResult
    func edges(to view: UIView, insets: UIEdgeInsets = .zero, priority: UILayoutPriority = .defaultHigh, isActive: Bool = true) -> Constraints {
        let constraints = [
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).with(priority),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).with(priority),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).with(priority),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    func size(_ size: CGSize, priority: UILayoutPriority = .defaultHigh, isActive: Bool = true) -> Constraints {
        let constraints = [
            widthAnchor.constraint(equalToConstant: size.width).with(priority),
            heightAnchor.constraint(equalToConstant: size.height).with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    func center(in view: UIView, offset: CGPoint = .zero, priority: UILayoutPriority = .defaultHigh, isActive: Bool = true) -> Constraints {
        let constraints = [
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x).with(priority),
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y).with(priority)
        ]
        
        if isActive {
            Constraint.activate(constraints)
        }
        
        return constraints
    }
    
    @discardableResult
    public func top(to view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority =  .defaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = topAnchor.constraint(equalTo: anchor ?? view.topAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func bottom(to view: UIView, _ anchor: NSLayoutYAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority =  .defaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = bottomAnchor.constraint(equalTo: anchor ?? view.bottomAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    @discardableResult
    public func left(to view: UIView, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority =  .defaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = leftAnchor.constraint(equalTo: anchor ?? view.leftAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
    
    @discardableResult
    public func right(to view: UIView, _ anchor: NSLayoutXAxisAnchor? = nil, offset: CGFloat = 0, priority: UILayoutPriority =  .defaultHigh, isActive: Bool = true) -> Constraint {
        let constraint = rightAnchor.constraint(equalTo: anchor ?? view.rightAnchor, constant: offset).with(priority)
        constraint.isActive = isActive
        return constraint
    }
    
}
