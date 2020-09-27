/// A `FiniteRange` with at most one open end.
public protocol HalfOpenRange: FiniteRange {
    /// The boundary of the range which is guaranteed to be closed.
    ///
    /// - Parameter isLower: If `closedBound.bound` is the lower bound of the
    ///   range.
    var closedBound: (bound: Bound, isLower: Bool) { get }
    /// The boundary of the range which can be, but is not necessarily, open.
    var otherBound: BoundDescription<Bound> { get }
}

extension HalfOpenRange {
    public var lowerBoundDescription: BoundDescription<Bound> {
        if closedBound.isLower {
            return .closed(closedBound.bound)
        }
        return otherBound
    }

    public var upperBoundDescription: BoundDescription<Bound> {
        if closedBound.isLower {
            return otherBound
        }
        return .closed(closedBound.bound)
    }
}