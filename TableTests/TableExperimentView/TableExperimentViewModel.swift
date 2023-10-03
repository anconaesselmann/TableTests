//  Created by Axel Ancona Esselmann on 10/2/23.
//

import SwiftUI

class TableExperimentViewModel: ObservableObject {

    @MainActor
    private(set)
    var sections: [SectionData]

    @MainActor
    var loading: Bool = false

    @MainActor
    var sortOrder = [KeyPathComparator(\TableRowData.a)] {
        didSet {
            Task {
                await MainActor.run {
                    loading = true
                    self.objectWillChange.send()
                }
                await MainActor.run {
                    sections.sort(\.items, using: sortOrder.itemDataComparators)
                    loading = false
                    self.objectWillChange.send()
                }
            }
        }
    }

    var selection: TableRowData.ID?

    init() {
        sections = (0..<30).map { _ in
            SectionData(items: (0..<1000).map { _ in ItemData.randomItem() })
        }
    }
}
