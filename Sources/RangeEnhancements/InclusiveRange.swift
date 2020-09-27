/// A range which contains all of its boundaries.
public protocol InclusiveRange: RangeProtocol {
    /// The range's lower bound if it has one.
    var lowerBound: Bound? { get }
    /// The range's upper bound if it has one.
    var upperBound: Bound? { get }
}

extension InclusiveRange {
    public var lowerBoundDescription: BoundDescription<Bound>? {
        guard let bound = lowerBound else { return nil }
        return .closed(bound)
    }

    public var upperBoundDescription: BoundDescription<Bound>? {
        guard let bound = upperBound else { return nil }
        return .closed(bound)
    }
}

public protocol _InclusiveRangeLowerWorkaround {
    associatedtype Bound
    var lowerBound: Bound { get }
}

extension _InclusiveRangeLowerWorkaround where Self: InclusiveRange {
    public var lowerBound: Bound? { .some(lowerBound) }
}

public protocol _InclusiveRangeUpperWorkaround {
    associatedtype Bound
    var upperBound: Bound { get }
}

extension _InclusiveRangeUpperWorkaround where Self: InclusiveRange {
    public var upperBound: Bound? { .some(upperBound) }
}