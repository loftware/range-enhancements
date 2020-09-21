/// A range which has closed lower and upper bounds.
public protocol ConcreteRange: InclusiveRange, HalfOpenRange {
    /// The lower bound of the range.
    var lowerBound: Bound { get }
    /// The upper bound of the range.
    var upperBound: Bound { get }
}

extension ConcreteRange {
    public var lowerBoundDescription: BoundDescription<Bound>? {
        return .closed(lowerBound)
    }

    public var upperBoundDescription: BoundDescription<Bound>? {
        return .closed(upperBound)
    }

    public var maybeLowerBound: Bound? { lowerBound }
    public var maybeUpperBound: Bound? { upperBound }
}

extension ConcreteRange {
    public var closedBoundIsLower: Bool { true }
    public var closedBound: Bound { lowerBound }
    public var otherBound: BoundDescription<Bound> { .closed(upperBound) }
}