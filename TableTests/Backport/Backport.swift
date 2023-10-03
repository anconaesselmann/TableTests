//  Created by Axel Ancona Esselmann on 10/3/23.
//

import Foundation

struct Backport<Content> {
    let content: Content

    init(_ content: Content) {
        self.content = content
    }
}

struct BackportType { }
