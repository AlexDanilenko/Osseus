import UIKit

public extension UIStackView.Alignment {
    
    init(_ vAlignment: VStackAlignment) {
        switch vAlignment {
        case .fill:
            self = .fill
        case .top:
            self = .top
        case .center:
            self = .center
        case .bottom:
            self = .bottom
        }
    }
    
    init(_ hAlignment: HStackAlignment) {
        switch hAlignment {
        case .fill:
            self = .fill
        case .leading:
            self = .leading
        case .center:
            self = .center
        case .trailing:
            self = .trailing
        }
    }
}

public extension UIStackView.Distribution {
    
    init(_ distribution: StackDistribution) {
        switch distribution {
        case .fill:
            self = .fill
        case .fillEqually:
            self = .fillEqually
        case .fillProportionally:
            self = .fillProportionally
        case .equalSpacing:
            self = .equalSpacing
        case .equalCentering:
            self = .equalCentering
        }
    }
}

public extension UIEdgeInsets {
    
    init(_ insets: StackEdgeInsets) {
        self.init(top: insets.top, left: insets.left, bottom: insets.bottom, right: insets.right)
    }
}
