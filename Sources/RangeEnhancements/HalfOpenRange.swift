/// A `FiniteRange` with at most one open end.
public protocol HalfOpenRange: FiniteRange {
    var closedBoundIsLower: Bool { get }
    var closedBound: Bound { get }
    var otherBound: BoundDescription<Bound> { get }
}

extension HalfOpenRange {
    public var lowerBoundDescription: BoundDescription<Bound> {
        if !closedBoundIsLower {
            return otherBound
        }
        return .closed(closedBound)
    }

    public var upperBoundDescription: BoundDescription<Bound> {
        if closedBoundIsLower {
            return otherBound
        }
        return .closed(closedBound)
    }
}