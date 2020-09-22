extension Comparable {
    /// Constrains the value to the given range.
    ///
    /// If the value is below the ranges `lowerBound`, or above the range's
    /// `upperBound`, the violated boundary will be returned.
    public func constrain<RangeType: InclusiveRange>(
        to range: RangeType
    ) -> Self where RangeType.Bound == Self {
        switch (range.lowerBound, range.upperBound) {
        case (nil, nil): return self
        case let (lowerBound?, nil): return max(self, lowerBound)
        case let (nil, upperBound?): return min(self, upperBound)
        case let (lowerBound?, upperBound?):
            return max(lowerBound, min(upperBound, self))
        }
    }
}