import UIKit

public class PlaceholderView: UIView {    
    
    private let view = UIView(frame: .zero)
    private let style: Placeholder.Style
    
    public init(style: Placeholder.Style) {
        self.style = style
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init from code")
    }
    
    private func render(style: Placeholder.Style) {
        backgroundColor = style.backgroundColor
        adopt(layout: style.sizing)
        set(corners: style.corners, for: self)
    }
    
    private func adopt(layout: Placeholder.Sizing) {
        switch layout {
        case .auto:
            return
        case let .aspect(h: height, w: width):
            heightAnchor.constraint(equalTo: widthAnchor, multiplier: height/width).isActive = true
        case let .size(size):
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    }
    
    private func set(corners: Placeholder.Style.Corners, for view: UIView) {
        switch corners {
        case .round:
            view.layer.cornerRadius = view.bounds.size.height / 2
        case let .static(radius):
            view.layer.cornerRadius = radius
        }
        
        view.layer.masksToBounds = true
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        render(style: style)
    }
}

