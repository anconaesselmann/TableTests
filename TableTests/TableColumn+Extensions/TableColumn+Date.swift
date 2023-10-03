//  Created by Axel Ancona Esselmann on 10/3/23.
//

import SwiftUI

extension TableColumn where Sort == KeyPathComparator<RowValue>, Label == Text {
    init<T>(
        _ titleKey: LocalizedStringKey,
        value: KeyPath<RowValue, T>,
        formatter: DateFormatter = DefaultFormatters.date
    )
    where
        Content == Text,
        T: ComparatorComparable,
        T: RowDateConvertable
    {
        self.init(titleKey, value: value, comparator: NoneOptionalComparator<T>()) { rowValue in
            Text(formatter.string(from: rowValue[keyPath: value].rowDateValue))
        }
    }
}

extension TableColumn where Sort == KeyPathComparator<RowValue>, Label == Text {
    init<T>(
        _ titleKey: LocalizedStringKey,
        value: KeyPath<RowValue, T?>,
        formatter: DateFormatter = DefaultFormatters.date
    )
    where
        Content == Text,
        T: ComparatorComparable,
        T: RowDateConvertable
    {
        self.init(titleKey, value: value, comparator: OptionalComparator<T>()) { rowValue in
            Text({
                if let value = rowValue[keyPath: value]?.rowDateValue {
                    return formatter.string(from: value)
                } else {
                    return ""
                }
            }())
        }
    }
}
