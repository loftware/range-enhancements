extension PartialRangeFrom: InclusiveRange, _InclusiveRangeLowerWorkaround {
    public var upperBound: Bound? { nil }
}