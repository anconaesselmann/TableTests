//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation

// https://useyourloaf.com/blog/custom-sort-comparators/
extension ComparisonResult {
    var reversed: ComparisonResult {
        switch self {
        case .orderedAscending: return .orderedDescending
        case .orderedSame: return .orderedSame
        case .orderedDescending: return .orderedAscending
        }
    }
}
