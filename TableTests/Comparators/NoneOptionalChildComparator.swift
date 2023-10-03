//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation

struct NoneOptionalChildComparator<Child, T>: SortComparator
    where T: ComparatorComparable
{
    var order: SortOrder = .forward

    let keyPath: KeyPath<Child, T>

    func compare(_ lhs: Child, _ rhs: Child) -> ComparisonResult {
        let result: ComparisonResult = lhs[keyPath: keyPath].compare(rhs[keyPath: keyPath])
        return order == .forward ? result : result.reversed
    }
}
