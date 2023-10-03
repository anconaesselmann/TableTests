//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation

extension String: RowStringConvertable {
    var rowStringValue: String {
        self
    }
}

extension Int: RowStringConvertable {
    var rowStringValue: String {
        String(self)
    }
}

extension Bool: RowStringConvertable {
    var rowStringValue: String {
        String(self ? "true" : "false")
    }
}
