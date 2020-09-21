/// A range boundary including and whether it is an open or closed boundary.
public enum BoundDescription<Bound: Comparable> {
    /// The range includes the `Bound`.
    case closed(Bound)
    /// The range includes everything up to, but not including, the `Bound`.
    case `open`(Bound)

    public var bound: Bound {
        switch self {
        case .closed(let bound): return bound
        case .open(let bound): return bound
        }
    }
}

extension BoundDescription {
    public var isOpen: Bool {
        if case .closed(_) = self { return true }
        return false
    }
}

extension BoundDescription: Equatable {}