extension PartialRangeThrough: InclusiveRange {
    public var maybeLowerBound: Bound? { nil }
    public var maybeUpperBound: Bound? { upperBound }
}