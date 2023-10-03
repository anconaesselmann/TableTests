//  Created by Axel Ancona Esselmann on 10/2/23.
//

import SwiftUI

extension TableColumn where Sort == KeyPathComparator<RowValue>, Label == Text {
    init<T>(
        _ titleKey: LocalizedStringKey,
        value: KeyPath<RowValue, T?>
    )
    where
        Content == Text,
        T: ComparatorComparable,
        T: RowStringConvertable
    {
        self.init(titleKey, value: value, comparator: OptionalComparator<T>()) { rowValue in
            Text(rowValue[keyPath: value]?.rowStringValue ?? "")
        }
    }
}

extension TableColumn where Sort == KeyPathComparator<RowValue>, Label == Text {
    init<T>(
        _ titleKey: LocalizedStringKey,
        value: KeyPath<RowValue, T>
    )
    where
        Content == Text,
        T: ComparatorComparable,
        T: RowStringConvertable
    {
        self.init(titleKey, value: value, comparator: NoneOptionalComparator<T>()) { rowValue in
            Text(rowValue[keyPath: value].rowStringValue)
        }
    }
}
