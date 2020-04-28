//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


public extension PlaceholderView.Body {
    
    static func rect(color: UIColor) -> PlaceholderView.Body {
        .init(corners: .static(0), backgroundColor: color, sizing: .auto)
    }
    
    static func circle(color: UIColor, d: CGFloat) -> PlaceholderView.Body {
        .init(corners: .round, backgroundColor: color, sizing: .size(.init(width: d, height: d)))
    }
    
    static let grayRect: PlaceholderView.Body = rect(color: .lightGray)
    static let redRect: PlaceholderView.Body =  rect(color: .red)
    static let clear: PlaceholderView.Body = rect(color: .clear)
    static let blueRect: PlaceholderView.Body = rect(color: .blue)
    static let square: PlaceholderView.Body = .init(corners: .static(0), backgroundColor: .clear, sizing: .aspect(h: 1, w: 1))
        
    static let grayCercle: PlaceholderView.Body = .circle(color: .lightGray, d: 50)
}

extension Placeholder {
    
    static let lLabel: Placeholder = .placeholder(.init(corners: .static(6), backgroundColor: .lightGray, sizing: .auto))
    
    static let sLabel: Placeholder = .hContainer(
        .init(
            spacing: 0,
            alignment: .leading,
            distribution: .fillProportionally,
            inset: .init(top: 0, left: 0, bottom: 0, right: 20)),
        [.placeholder(.init(corners: .static(6), backgroundColor: .lightGray, sizing: .auto))]
    )
    
    static let labels: Placeholder = .vContainer(
        VStack.init(
            spacing: 5,
            alignment: .fill,
            distribution: .fillEqually,
            inset: .init(top: 5, left: 5, bottom: 15, right: 0)
        ),
        [.lLabel, .sLabel]
    )
    
    static let avatar: Placeholder = .container(.clear, .placeholder(.grayCercle))
    
    static let user: Placeholder = .hContainer(
        .init(spacing: 10, alignment: .leading, distribution: .fill, inset: .zero),
        [.avatar, .labels])
    

    static let splitUser: Placeholder = .hContainer(
        .init(spacing: 20, alignment: .fill, distribution: .fillEqually, inset: .zero),
        [.user, .user, .user]
    )
    
    static let blocks: Placeholder = .vContainer(
        .init(spacing: 10,
              alignment: .center,
              distribution: .fillEqually,
              inset: .init(top: 200, left: 20, bottom: 0, right: 20)),
        [.splitUser, .splitUser,.splitUser,.splitUser,.splitUser]
    )
}











private func makeGenericStackView<A>(_ stack: Stack<A>) -> UIStackView {
    let stackView = UIStackView()
    
    stackView.spacing = stack.spacing
    stackView.distribution = .init(stack.distribution)
    stackView.layoutMargins = .init(stack.inset)
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}

private func makeStack(_ stack: HStack) -> UIStackView {
    let stack = makeGenericStackView(stack)
    stack.axis = .horizontal
    return stack
}

private func makeStack(_ stack: VStack) -> UIStackView {
    let stack = makeGenericStackView(stack)
    stack.axis = .vertical
    return stack
}

class MyViewController : UIViewController {
    
    var contentStack: UIStackView = makeGenericStackView(VStack.init(spacing: 0, alignment: .fill, distribution: .fill, inset: .zero))
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        self.view.addSubview(contentStack)
        contentStack.top(to: view)
        contentStack.left(to: view)
        contentStack.right(to: view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        render(.blocks, container: contentStack)
    }
    
    private func render(_ content: Placeholder, container: UIStackView) {
        switch content {
        case let .vContainer(axis, elements):
            let stack = makeStack(axis)
            elements.forEach { render($0, container: stack) }
            container.addArrangedSubview(stack)
        case let .hContainer(axis, elements):
            let stack = makeStack(axis)
            elements.forEach { render($0, container: stack) }
            container.addArrangedSubview(stack)
        case let .placeholder(body):
            let placeholderView = PlaceholderView(body: body)
            container.addArrangedSubview(placeholderView)
        case let .container(body, element):
            let view = PlaceholderView(body: body)
            
            let stack = makeStack(.init(spacing: 0, alignment: HStackAlignment.fill, distribution: .fillEqually, inset: .zero))

            render(element, container: stack)
            
            view.addSubview(stack)
            stack.edges(to: view)
            container.addArrangedSubview(view)
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
