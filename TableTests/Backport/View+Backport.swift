//  Created by Axel Ancona Esselmann on 10/3/23.
//

import SwiftUI

extension View {
    var backport: Backport<Self> { Backport(self) }
}
