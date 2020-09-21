extension PartialRangeFrom: InclusiveRange {
    public var maybeLowerBound: Bound? { lowerBound }
    public var maybeUpperBound: Bound? { nil }
}