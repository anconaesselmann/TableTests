//  Created by Axel Ancona Esselmann on 9/30/23.
//

import SwiftUI

@main
struct TableTestsApp: App {

    @StateObject
    private var sectionManager = SectionManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sectionManager)
        }
    }
}
