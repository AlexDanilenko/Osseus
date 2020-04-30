import UIKit

public enum Placeholder {    
    case placeholder(Style)
    indirect case container(Style, Placeholder)
    indirect case vContainer(VStack, [Placeholder])
    indirect case hContainer(HStack, [Placeholder])
    
    public enum Sizing {
        case auto
        case size(CGSize)
        case height(CGFloat)
        case width(CGFloat)
        case aspect(h: CGFloat, w: CGFloat)
        
        public static let square: Sizing = .aspect(h: 1, w: 1)
    }
    
    public struct Style {
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
}
