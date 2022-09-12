import SwiftUI

// MARK: - DestinationView

protocol DestinationView {
    var navigationBarTitleConfiguration: NavigationBarTitleConfiguration { get }
}

// MARK: - NavigationBarAppearance

enum NavigationBarAppearance {

    // MARK: - Types

    case `default`
    case transparent
    case opaque(UIColor)
}

// MARK: - NavigationBarTitleConfiguration

struct NavigationBarTitleConfiguration {

    // MARK: - Internal Properties

    let title: String
    let displayMode: NavigationBarItem.TitleDisplayMode
    let titleColor: Color
    let backButtonColor: Color
    let appearance: NavigationBarAppearance

    // MARK: - Life Cycle

    init(
        title: String,
        displayMode: NavigationBarItem.TitleDisplayMode,
        titleColor: Color = Color.pink,
        backButtonColor: Color = Color.black,
        appearance: NavigationBarAppearance = .default
    ) {
        self.title = title
        self.displayMode = displayMode
        self.titleColor = titleColor
        self.backButtonColor = backButtonColor
        self.appearance = appearance
    }
}
