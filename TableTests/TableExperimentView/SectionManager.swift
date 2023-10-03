//  Created by Axel Ancona Esselmann on 10/2/23.
//

import Foundation

class SectionManager: ObservableObject {

    var expanded: Set<SectionData.ID> = []

    func isSectionExpanded(_ sectionId: SectionData.ID) -> Bool {
        expanded.contains(sectionId)
    }

    func toggle(sectionWithId sectionId: SectionData.ID) {
        expanded.toggle(sectionId)
        self.objectWillChange.send()
    }

    func collapse(sectionWithId sectionId: SectionData.ID) {
        if expanded.contains(sectionId) {
            expanded.remove(sectionId)
            self.objectWillChange.send()
        }
    }
}
