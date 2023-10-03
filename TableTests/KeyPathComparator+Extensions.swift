//  Created by Axel Ancona Esselmann on 10/3/23.
//

import Foundation

extension KeyPathComparator {
    init<Value>(
        value keyPath: KeyPath<Compared, Value?>,
        order: SortOrder
    )
        where Value: ComparatorComparable
    {
        self.init(keyPath, comparator: OptionalComparator<Value>(), order: order)
    }
}

extension KeyPathComparator {
    init<Value>(
        value keyPath: KeyPath<Compared, Value>,
        order: SortOrder
    )
        where Value: ComparatorComparable
    {
        self.init(keyPath, comparator: NoneOptionalComparator<Value>(), order: order)
    }
}

extension KeyPathComparator {
    init<ChildValue, Value>(
        child childKeyPath: KeyPath<Compared, ChildValue?>,
        value keyPath: KeyPath<ChildValue, Value>,
        order: SortOrder
    )
        where Value: ComparatorComparable
    {
        self.init(childKeyPath, comparator: OptionalChildComparator(keyPath: keyPath), order: order)
    }
}

extension KeyPathComparator {
    init<ChildValue, Value>(
        child childKeyPath: KeyPath<Compared, ChildValue?>,
        value keyPath: KeyPath<ChildValue, Value?>,
        order: SortOrder
    )
        where Value: ComparatorComparable
    {
        self.init(childKeyPath, comparator: OptionalChildComparatorWithOptionalProperty(keyPath: keyPath), order: order)
    }
}

extension KeyPathComparator {
    init<ChildValue, Value>(
        child childKeyPath: KeyPath<Compared, ChildValue>,
        value keyPath: KeyPath<ChildValue, Value>,
        order: SortOrder
    )
        where Value: ComparatorComparable
    {
        self.init(childKeyPath, comparator: NoneOptionalChildComparator(keyPath: keyPath), order: order)
    }
}
