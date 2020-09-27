extension PartialRangeThrough: InclusiveRange, _InclusiveRangeUpperWorkaround {
    public var lowerBound: Bound? { nil }
}