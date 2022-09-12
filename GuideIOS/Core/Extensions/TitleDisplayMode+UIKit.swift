import SwiftUI
import UIKit

// MARK: - NavigationBarItem.TitleDisplayMode ()

extension NavigationBarItem.TitleDisplayMode {

    // MARK: - Internal Properties

    var uiDisplayMode: UINavigationItem.LargeTitleDisplayMode {
        switch self {
        case .automatic:
            return .automatic
        case .inline:
            return .never
        case .large:
            return .always
        @unknown default:
            return .automatic
        }
    }
}
