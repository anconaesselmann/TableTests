//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation

struct TableRowData: Identifiable {
    var id = UUID()
    let a: String
    var b: String?
    var c: Bool
    var number: Double?
    var childA: Int?
    var childB: ChildData.Options?
    var childC: String?
    var childDate: Date?
}
