extension Range: HalfOpenRange {
    public var closedBoundIsLower: Bool { true }

    public var closedBound: Bound { return lowerBound }
    public var otherBound: BoundDescription<Bound> {
        .open(upperBound)
    }
}