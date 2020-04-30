import Foundation

public enum Either<A,B> {
    case right(A)
    case left(B)
}
