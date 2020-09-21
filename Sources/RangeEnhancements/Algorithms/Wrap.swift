extension Strideable {
    fileprivate func wrapUpper<RangeType: HalfOpenRange>(
        in range: RangeType,
        usingStride stride: Self.Stride
    ) -> Self where RangeType.Bound == Self {
        var wrapAmount = range.upperBoundDescription.bound.distance(to: self)
        while wrapAmount - stride >= 0 {
            wrapAmount -= stride
        }
        if wrapAmount == 0{
            if !range.closedBoundIsLower {
                return range.upperBoundDescription.bound
            } else if case .closed(_) = range.otherBound {
                return range.upperBoundDescription.bound
            }
        }
        return range.lowerBoundDescription.bound.advanced(by: wrapAmount)
    }

    fileprivate func wrapLower<RangeType: HalfOpenRange>(
        in range: RangeType,
        usingStride stride: Self.Stride
    ) -> Self where RangeType.Bound == Self {
        var wrapAmount = self.distance(to: range.lowerBoundDescription.bound)
        while wrapAmount - stride >= 0 {
            wrapAmount -= stride
        }
        if wrapAmount == 0{
            if range.closedBoundIsLower {
                return range.lowerBoundDescription.bound
            } else if case .closed(_) = range.otherBound {
                return range.lowerBoundDescription.bound
            }
        }
        return range.upperBoundDescription.bound.advanced(by: -wrapAmount)
    }

    public func wrap<RangeType: HalfOpenRange>(
        in range: RangeType
    ) -> Self where RangeType.Bound == Self {
        let (lower, upper) = (range.lowerBoundDescription.bound,
            range.upperBoundDescription.bound)
        if self <= lower {
            return wrapLower(in: range, usingStride: lower.distance(to: upper))
        } else if self >= upper {
            return wrapUpper(in: range, usingStride: lower.distance(to: upper))
        } else {
            return self
        }
    }
}