//  Created by Axel Ancona Esselmann on 10/2/23.
//

import SwiftUI
import TableTop

struct TableExperimentView: View {
    @StateObject
    private var vm = TableExperimentViewModel()

    @EnvironmentObject
    private var sectionManager: SectionManager

    var body: some View {
        ZStack {
            VStack {
                Table(
                    of: TableRowData.self,
                    selection: $vm.selection,
                    sortOrder: $vm.sortOrder
                ) {
                    TableColumn("a", value: \.a)
                    TableColumn("b", value: \.b)
                    TableColumn("c", value: \.c)
                    TableColumn("number", value: \.number, formatter: DefaultFormatters.currency)
                    TableColumn("child_a", value: \.childA)
                    TableColumn("child_b", value: \.childB)
                    TableColumn("child_c", value: \.childC)
                    TableColumn("date", value: \.childDate)
                } rows: {
                    ForEach(vm.sections) { sectionData in
                        Section {
                            if sectionManager.isSectionExpanded(sectionData.id) {
                                ForEach(sectionData.items) { item in
                                    TableRow(TableRowData(item))
                                }
                            }
                        } header: {
                            SectionHeaderView(sectionId: sectionData.id)
                                .environmentObject(sectionManager)
                        }
                    }
                }
            }
            .backport.onKeyPress(.leftArrow) {
                collapseSelectedSection()
                return .handled
            }
            if vm.loading {
                LoadingView()
            }
        }
    }

    private func collapseSelectedSection() {
        guard let sectionId = vm.selectedSectionId else {
            return
        }
        Task { @MainActor in
            vm.selection = nil
            sectionManager.collapse(sectionWithId: sectionId)
        }
    }
}
