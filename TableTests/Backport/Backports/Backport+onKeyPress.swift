//  Created by Axel Ancona Esselmann on 10/3/23.
//

import SwiftUI

extension Backport where Content: View {
    @ViewBuilder
    func onKeyPress(_ key: KeyEquivalent, action: @escaping () -> BackportType.KeyPress.Result) -> some View {
        if #available(macOS 14, *) {
            content.onKeyPress(key) {
                action().unwrap
            }
        } else {
            content
        }
    }
}

extension BackportType {
    struct KeyPress : Sendable {
        public enum Result : Sendable {
            case handled, ignored

            @available(macOS 14, *)
            var unwrap: SwiftUI.KeyPress.Result {
                switch self {
                case .handled: return .handled
                case .ignored: return .ignored
                }
            }
        }
    }
}
