extension PartialRangeUpTo: RangeProtocol {
    public var lowerBoundDescription: BoundDescription<Bound>? {
        return nil
    }

    public var upperBoundDescription: BoundDescription<Bound>? {
        return .open(upperBound)
    }
}