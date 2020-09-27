/// A range of values.
public protocol RangeProtocol: RangeExpression {
    /// A description of the range's lower bound if it has one.
    var lowerBoundDescription: BoundDescription<Bound>? { get }
    /// A description of the range's upper bound if it has one.
    var upperBoundDescription: BoundDescription<Bound>? { get }
}

extension RangeProtocol {
    public var isEmpty: Bool {
        guard let lower = lowerBoundDescription else { return false }
        guard let upper = upperBoundDescription else { return false }
        return lower.bound == upper.bound && (lower.isOpen || upper.isOpen)
    }
}