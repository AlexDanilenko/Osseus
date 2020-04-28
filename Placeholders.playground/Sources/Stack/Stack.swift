import UIKit

public typealias VStack = Stack<VStackAlignment>
public typealias HStack = Stack<HStackAlignment>

public struct Stack<Alignment> {
    public let spacing: CGFloat
    public let alignment: Alignment
    public let distribution: StackDistribution
    public let inset: StackEdgeInsets
    
    public init(spacing: CGFloat, alignment: Alignment, distribution: StackDistribution, inset: StackEdgeInsets) {
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.inset = inset
    }
}

public struct StackEdgeInsets {
    public let top, left, bottom, right: CGFloat
    
    public init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
    
    public static let zero = StackEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
}

public enum StackDistribution {
    case fill, fillEqually, fillProportionally, equalSpacing, equalCentering
}

public enum VStackAlignment {
    case fill, top, center, bottom
}

public enum HStackAlignment {
    case fill, leading, center, trailing
}
