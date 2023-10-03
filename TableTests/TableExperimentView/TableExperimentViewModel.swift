//  Created by Axel Ancona Esselmann on 10/2/23.
//

import SwiftUI

@MainActor
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

    @MainActor
    var selection: TableRowData.ID?

    @MainActor
    var selectedSectionId: SectionData.ID? {
        guard let selected = selection else {
            return nil
        }
        guard let section = sections.first(where: { section in
            section.items.contains(where: { $0.id == selected })
        }) else
        {
            return nil
        }
        return section.id
    }

    init() {
        sections = (0..<10).map { _ in
            SectionData(items: (0..<100).map { _ in ItemData.randomItem() })
        }
    }

}
