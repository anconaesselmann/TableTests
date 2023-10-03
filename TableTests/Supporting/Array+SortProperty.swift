//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation

extension Array {
    mutating func sort<S, T, Comparator>(_ keyPath: WritableKeyPath<Element, [T]>, using comparators: S)
        where
            S: Sequence,
            Comparator: SortComparator,
            Comparator == S.Element,
            T == Comparator.Compared
    {
        for i in 0..<count {
            self[i][keyPath: keyPath].sort(using: comparators)
        }
    }
}
