import Foundation

public enum Placeholder {    
    case placeholder(PlaceholderView.Body)
    indirect case container(PlaceholderView.Body, Placeholder)
    indirect case vContainer(VStack, [Placeholder])
    indirect case hContainer(HStack, [Placeholder])
}
