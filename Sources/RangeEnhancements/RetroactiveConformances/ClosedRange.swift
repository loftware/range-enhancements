// Unfortunately, we have to hand-write these again here as swift will tell you
// that the default implementations for these methods based on `lowerBound` and
// `upperBound` conflict, even when one of them is on `ClosedRange` itself, and
// the other are on protocols `ClosedRange` refines. I'm not sure if that's a
// bug or not, but it definitely sucks.
extension ClosedRange: ConcreteRange, _InclusiveRangeLowerWorkaround,
    _InclusiveRangeUpperWorkaround {}