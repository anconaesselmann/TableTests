//  Created by Axel Ancona Esselmann on 10/3/23.
//

import Foundation

extension TableRowData {
    init(_ item: ItemData) {
        self.init(
            id: item.id,
            a: item.a,
            b: item.b,
            c: item.c,
            number: item.number,
            childA: item.child?.a,
            childB: item.child?.b,
            childC: item.child?.c,
            childDate: item.child?.date
        )
    }
}

extension Array where Element == KeyPathComparator<TableRowData> {
    var itemDataComparators: [KeyPathComparator<ItemData>] {
        compactMap {
            switch $0.keyPath {
            case \.a: return .init(value: \.a, order: $0.order)
            case \.b: return .init(value: \.b, order: $0.order)
            case \.c: return .init(value: \.c, order: $0.order)
            case \.number: return .init(value: \.number, order: $0.order)
            case \.childA: return .init(child: \.child, value: \.a, order: $0.order)
            case \.childB: return .init(child: \.child, value: \.b, order: $0.order)
            case \.childC: return .init(child: \.child, value: \.c, order: $0.order)
            case \.childDate: return .init(child: \.child, value: \.date, order: $0.order)
            default: return nil
            }
        }
    }
}
