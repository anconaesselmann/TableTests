//  Created by Axel Ancona Esselmann on 10/2/23.
//

import SwiftUI

struct SectionHeaderView: View {

    @EnvironmentObject
    private var sectionManager: SectionManager

    let sectionId: SectionData.ID

    var isExpanded: Bool {
        sectionManager.isSectionExpanded(sectionId)
    }

    var body: some View {
        HStack {
            Image(systemName: isExpanded ? "chevron.down" : "chevron.forward")
                .frame(minWidth: 16)
                .frame(maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    // NOTE: On macOS 14 the animation rearranges headers and rows.
                    //       I haven't found a solution for not doing that.
//                    withAnimation {
//                        sectionManager.toggle(sectionWithId: sectionId)
//                    }
                    sectionManager.toggle(sectionWithId: sectionId)
                }
            Text("Items")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

extension SectionHeaderView: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.sectionId == rhs.sectionId
    }
}

//struct SectionHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionHeaderView()
//    }
//}
