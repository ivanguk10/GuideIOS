import AppTrackingTransparency
import SwiftUI

// MARK: - NavigationBarTitle

struct NavigationBarTitle: ViewModifier {

    // MARK: - Internal Properties

    var configuration: NavigationBarTitleConfiguration

    // MARK: - Internal Methods

    func body(content: Content) -> some View {
        content
            .navigationBarTitle(configuration.title, displayMode: configuration.displayMode)
    }
}

// MARK: - View ()

extension View {

    // MARK: - Internal Methods

    func navigationBarTitle(configuration: NavigationBarTitleConfiguration) -> some View {
        modifier(NavigationBarTitle(configuration: configuration))
    }
}

// MARK: - RootView

struct RootView: ViewModifier {

    // MARK: - Internal Properties

    var navigation: Navigation

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .environmentObject(navigation)
            
    }
}

// MARK: - View ()

extension View {

    // MARK: - Internal Methods

    func rootView(navigation: Navigation) -> some View {
        modifier(RootView(navigation: navigation))
    }
}
