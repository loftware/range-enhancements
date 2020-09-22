extension Range: HalfOpenRange {
    public var closedBound: (bound: Bound, isLower: Bool) { (lowerBound, true) }
    public var otherBound: BoundDescription<Bound> { .open(upperBound) }
}