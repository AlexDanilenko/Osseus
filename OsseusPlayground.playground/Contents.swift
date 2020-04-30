//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Osseus

public extension Placeholder.Style {
    static func rect(color: UIColor, cornerRadius: CGFloat = 0, sizing: Placeholder.Sizing = .auto) -> Placeholder.Style {
        .init(corners: .static(cornerRadius), backgroundColor: color, sizing: sizing)
    }
}

extension Placeholder {
    
    static let lobby: Placeholder = .placeholder(
        .rect(
            color: .lightGray,
            cornerRadius: 2,
            sizing: .height(16)
        )
    )
    static let lobbyBlock: Placeholder = .hContainer(
        .init(
            spacing: 56,
            alignment: .fill,
            distribution: .fillEqually,
            inset: .init(
                top: 20,
                left: 30,
                bottom: 0,
                right: 30
            )
        ),
        [.lobby, .lobby, .lobby]
    )
    
    static let banner: Placeholder = .placeholder(
        .rect(
            color: .lightGray,
            cornerRadius: 12,
            sizing: .height(220)
        )
    )
    
    static let bannersBlock: Placeholder = .hContainer(
        .init(
            spacing: 10,
            alignment: .fill,
            distribution: .fillEqually,
            inset: .init(
                top: 32,
                left: 16,
                bottom: 16,
                right: -300
            )
        ),
        [.banner, .banner]
    )
    
    static let shift: Placeholder = .placeholder(
        .rect(
            color: .lightGray,
            cornerRadius: 8,
            sizing: .height(40)
        )
    )
    
    static let shifts: Placeholder = .hContainer(
        .init(
            spacing: 8,
            alignment: .fill,
            distribution: .fillEqually,
            inset: .init(
                top: 10,
                left: 16,
                bottom: 10,
                right: -25
            )
        ),
        [.shift, .shift, .shift, .shift]
    )
    
    static let game: Placeholder = .placeholder(
        .init(
            corners: .static(26),
            backgroundColor: .lightGray,
            sizing: .height(164)
        )
    )
    
    static let hGameBundle: Placeholder = .hContainer(
        .init(
            spacing: 16,
            alignment: .fill,
            distribution: .fillProportionally,
            inset: .zero
        ),
        [.game, .game]
    )
    
    static let vGameBundle: Placeholder = .vContainer(
        .init(
            spacing: 16,
            alignment: .fill,
            distribution: .fillEqually,
            inset: .init(
                top: 16,
                left: 16,
                bottom: 16,
                right: 16
            )
        ),
        [.hGameBundle, .hGameBundle]
    )
    
    static let casino: Placeholder = .vContainer(
        .init(
            spacing: 0,
            alignment: .fill,
            distribution: .fillProportionally,
            inset: .zero
        ),
        [.lobbyBlock, .bannersBlock, .shifts, .vGameBundle]
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
        
        placeholder.render(.casino)
    }
}

// Present the view controller in the Live View window
let vc = MyViewController()
    
PlaygroundPage.current.liveView = vc
