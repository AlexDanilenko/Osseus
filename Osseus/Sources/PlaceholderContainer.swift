import UIKit

public class PlaceholderContainer: UIView {
    var contentStack: UIStackView = makeGenericStackView(VStack.init(spacing: 0, alignment: .fill, distribution: .fill, inset: .zero))
    
    public init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        addSubview(contentStack)
        contentStack.center(in: self)
        contentStack.edges(to: self
            , insets: .zero, priority: .fittingSizeLevel, isActive: true)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(contentStack)
        contentStack.edges(to: self)
    }
    
    public func render(_ content: Placeholder) {
        render(content, container: contentStack)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        print(contentStack)
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
            let placeholderView = PlaceholderView(style: body)
            container.addArrangedSubview(placeholderView)
        case let .container(body, element):
            let view = PlaceholderView(style: body)
            let stack = makeStack(.init(spacing: 0, alignment: HStackAlignment.fill, distribution: .fillEqually, inset: .zero))

            render(element, container: stack)
            
            view.addSubview(stack)
            stack.edges(to: view)
            container.addArrangedSubview(view)
        }
    }
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
