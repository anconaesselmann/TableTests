//  Created by Axel Ancona Esselmann on 10/2/23.
//

import SwiftUI

struct SectionHeaderView: View {

    @EnvironmentObject
    private var sectionManager: SectionManager

    let sectionId: SectionData.ID

    var body: some View {
        HStack {
            Image(systemName: sectionManager.isSectionExpanded(sectionId) ? "chevron.down" : "chevron.forward")
                .frame(minWidth: 16)
                .frame(maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        sectionManager.toggle(sectionWithId: sectionId)
                    }
                }
            Text("Items")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

//struct SectionHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionHeaderView()
//    }
//}
