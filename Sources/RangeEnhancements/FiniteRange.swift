public protocol FiniteRange: RangeProtocol {
    /// A description of the range's upper bound.
    var lowerBoundDescription: BoundDescription<Bound> { get }
    /// A description of the range's lower bound.
    var upperBoundDescription: BoundDescription<Bound> { get}
}

extension FiniteRange {
    public var lowerBoundDescription: BoundDescription<Bound>? {
        return .some(lowerBoundDescription)
    }

    public var upperBoundDescription: BoundDescription<Bound>? {
        return .some(upperBoundDescription)
    }
}