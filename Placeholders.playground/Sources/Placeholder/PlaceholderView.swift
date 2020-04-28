import UIKit

public class PlaceholderView: UIView {
//    public typealias Sizing = Either<CGSize, UIEdgeInsets>
    
    
    public enum Sizing {
        case auto
        case size(CGSize)
        case aspect(h: CGFloat, w: CGFloat)
        
        public static let square: Sizing = .aspect(h: 1, w: 1)
    }
    
    public struct Body {
        public enum Corners {
            case round
            case `static`(CGFloat)
        }
        let corners: Corners
        let backgroundColor: UIColor
        let sizing: Sizing
        
        public init(corners: Corners, backgroundColor: UIColor, sizing: Sizing) {
            self.corners = corners
            self.backgroundColor = backgroundColor
            self.sizing = sizing
        }
    }
    
    private let view = UIView(frame: .zero)
    private let body: Body
    
    public init(body: Body) {
        self.body = body
        super.init(frame: .zero)
        render(body: body)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init from code")
    }
    
    func render(body: Body) {
        backgroundColor = body.backgroundColor
        translatesAutoresizingMaskIntoConstraints = false
        adopt(layout: body.sizing)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        set(corners: body.corners, for: self)
    }
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard superview != nil else { return }
        
    }
    
    private func adopt(layout: Sizing) {
        switch layout {
        case .auto:
            return
        case let .aspect(h: height, w: width):
            print("adopting")
            heightAnchor.constraint(equalTo: widthAnchor, multiplier: height/width).isActive = true
            print("adopted")
        case let .size(size):
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    }
    
    private func set(corners: Body.Corners, for view: UIView) {
        switch corners {
        case .round:
            view.layer.cornerRadius = view.bounds.size.height / 2
        case let .static(radius):
            view.layer.cornerRadius = radius
        }
        
        view.layer.masksToBounds = true
    }
}

