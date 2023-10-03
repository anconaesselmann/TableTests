//  Created by Axel Ancona Esselmann on 10/3/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Color.gray
            .opacity(0.1)
            .ignoresSafeArea()
        ProgressView()
    }
}

#Preview {
    LoadingView()
}
