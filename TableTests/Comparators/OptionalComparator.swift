//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation

struct OptionalComparator<Value>: SortComparator where Value: ComparatorComparable {
    var order: SortOrder = .forward

    func compare(_ lhs: Value?, _ rhs: Value?) -> ComparisonResult {
        let result: ComparisonResult
        switch (lhs, rhs) {
        case (nil, nil): result = .orderedSame
        case (.some, nil): result = .orderedDescending
        case (nil, .some): result = .orderedAscending
        case let (lhs?, rhs?): result = lhs.compare(rhs)
        }
        return order == .forward ? result : result.reversed
    }
}
