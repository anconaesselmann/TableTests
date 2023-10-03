//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation

struct OptionalChildComparator<Child, T>: SortComparator
    where T: ComparatorComparable
{
    var order: SortOrder = .forward

    let keyPath: KeyPath<Child, T>

    func compare(_ lhs: Child?, _ rhs: Child?) -> ComparisonResult {
        let result: ComparisonResult
        switch (lhs?[keyPath: keyPath], rhs?[keyPath: keyPath]) {
        case (nil, nil): result = .orderedSame
        case (.some, nil): result = .orderedDescending
        case (nil, .some): result = .orderedAscending
        case let (lhs?, rhs?): result = lhs.compare(rhs)
        }
        return order == .forward ? result : result.reversed
    }
}
