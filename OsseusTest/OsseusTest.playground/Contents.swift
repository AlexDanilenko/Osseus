//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


public extension Placeholder.Style {
    
    static func rect(color: UIColor, cornerRadius: CGFloat = 0) -> Placeholder.Style {
        .init(corners: .static(cornerRadius), backgroundColor: color, sizing: .auto)
    }
    
    static func square(color: UIColor, cornerRadius: CGFloat = 0) -> Placeholder.Style {
        .init(corners: .static(cornerRadius), backgroundColor: color, sizing: .aspect(h: 1, w: 1))
    }
    
    static func circle(color: UIColor, d: CGFloat) -> Placeholder.Style {
        .init(corners: .round, backgroundColor: color, sizing: .size(.init(width: d, height: d)))
    }
    
    static func autoCircle(color: UIColor) -> Placeholder.Style {
        .init(corners: .round, backgroundColor: color, sizing: .aspect(h: 1, w: 1))
    }
    
    static let grayRect: Placeholder.Style = .rect(color: .lightGray)
    static let redRect: Placeholder.Style =  .rect(color: .red)
    static let clear: Placeholder.Style = .rect(color: .clear)
    static let blueRect: Placeholder.Style = .rect(color: .blue)
        
    static let grayCercle: Placeholder.Style = .autoCircle(color: .lightGray)
}

extension Placeholder {
    
    static let lLabel: Placeholder = .placeholder(
        .rect(color: .lightGray, cornerRadius: 4)
    )
    
    static let labels: Placeholder = .vContainer(
        VStack.init(
            spacing: 10,
            alignment: .fill,
            distribution: .fillEqually,
            inset: .init(top: 0, left: 3, bottom: 0, right: 0)
        ),
        [.lLabel, .lLabel, .lLabel]
    )
    
    static let avatar: Placeholder = .placeholder(.grayCercle)
    
    static let user: Placeholder =
        .container(
            .redRect,
            .hContainer(
                .init(spacing: 0, alignment: .center, distribution: .fill, inset: .zero),
                [.avatar, .labels]
            )
    )

    static let splitUser: Placeholder = .hContainer(
        .init(spacing: 3, alignment: .fill, distribution: .fillEqually, inset: .zero),
        [.user, .user, .user]
    )
    
    static let blocks: Placeholder = .vContainer(
        .init(spacing: 30,
              alignment: .fill,
              distribution: .fillEqually,
              inset: .init(top: 100, left: 20, bottom: 20, right: 20)),
        [.splitUser, .splitUser, .splitUser]
    )
}

class MyViewController : UIViewController {
        
    let placeholder: PlaceholderContainer = .init()
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        self.view.addSubview(placeholder)
        
        placeholder.top(to: view)
        placeholder.left(to: view)
        placeholder.right(to: view)
        placeholder.bottom(to: view, offset: -300)
        
        placeholder.render(.blocks)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
