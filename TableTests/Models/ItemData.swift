//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation
import LoremSwiftum

struct ChildData: Identifiable {

    enum Options: String {
        case a, b, c
    }

    var id: UUID = UUID()
    var a: Int
    var b: Options
    var c: String?
    var date: Date?
}

struct ItemData: Identifiable {
    let id = UUID()
    let a: String
    var b: String? = nil
    var c: Bool = false
    var number: Double? = nil
    var child: ChildData?
}

extension ChildData.Options: RowStringConvertable {
    var rowStringValue: String {
        rawValue
    }
}

extension ChildData.Options: ComparatorComparable {
    func compare(_ value: ChildData.Options) -> ComparisonResult {
        rawValue.compare(value.rawValue)
    }
}

extension ItemData {
    static func randomItem() -> Self {
        ItemData(
            a: Lorem.firstName,
            b: Int.random(in: 0..<3) % 3 == 0 ? Lorem.lastName : nil,
            c: Bool.random(),
            number: Bool.random() ? Double.random(in: 0..<100) : nil,
            child: Bool.random() ? ChildData(
                a: Int.random(in: 0..<10000),
                b: .init(rawValue: ["a", "b", "c"].shuffled().first!)!,
                c: Int.random(in: 0..<5) % 5 == 0 ? Lorem.word : nil,
                date: .now.addingTimeInterval((Bool.random() ? -1 : 1) * Double.random(in: 0..<(60 * 60 * 24 * 365 * 10)))
            ) : nil
        )
    }
}
