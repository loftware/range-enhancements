/// A range which contains all of its boundaries.
// Note: The boundaries in this protocol are prefixed with maybe as otherwise
// it is impossible to conform to this protocol for anything that already
// publishes a non-optional `lowerBound`. The names conflict, preventing you
// from providing conformance, and optional computed properties do not satisfy
//
public protocol InclusiveRange: RangeProtocol {
    /// The range's lower bound if it has one.
    var maybeLowerBound: Bound? { get }
    /// The range's lower bound if it has one.
    var maybeUpperBound: Bound? { get }
}

extension InclusiveRange {
    public var lowerBoundDescription: BoundDescription<Bound>? {
        guard let bound = maybeLowerBound else { return nil }
        return .closed(bound)
    }

    public var upperBoundDescription: BoundDescription<Bound>? {
        guard let bound = maybeUpperBound else { return nil }
        return .closed(bound)
    }
}