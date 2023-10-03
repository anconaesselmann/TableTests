//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation

struct NoneOptionalComparator<Value>: SortComparator where Value: ComparatorComparable {
    var order: SortOrder = .forward

    func compare(_ lhs: Value, _ rhs: Value) -> ComparisonResult {
        let result = lhs.compare(rhs)
        return order == .forward ? result : result.reversed
    }
}
