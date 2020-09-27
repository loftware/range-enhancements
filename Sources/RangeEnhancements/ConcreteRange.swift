/// A range that has closed lower and upper bounds.
public protocol ClosedRangeProtocol: InclusiveRange, HalfOpenRange {
    /// The lower bound of the range.
    var lowerBound: Bound { get }
    /// The upper bound of the range.
    var upperBound: Bound { get }
}

extension ClosedRangeProtocol {
    public var lowerBoundDescription: BoundDescription<Bound>? {
        return .closed(lowerBound)
    }

    public var upperBoundDescription: BoundDescription<Bound>? {
        return .closed(upperBound)
    }
}

extension ClosedRangeProtocol {
    public var closedBound: (bound: Bound, isLower: Bool) { (lowerBound, true) }
    public var otherBound: BoundDescription<Bound> { .closed(upperBound) }
}
