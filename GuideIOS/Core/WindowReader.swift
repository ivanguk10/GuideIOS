import SwiftUI

// MARK: - WindowReader

struct WindowReader<Content>: View where Content: View {

    // MARK: - Private Properties

    private var content: (UIWindow?) -> Content
    private var window: UIWindow? {
        guard
            let scene = UIApplication.shared.connectedScenes.first,
            let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
            let window = windowSceneDelegate.window
        else {
            return nil
        }
        return window
    }

    // MARK: - Life Cycle

    init(@ViewBuilder content: @escaping (UIWindow?) -> Content) {
        self.content = content
    }

    // MARK: - Body

    var body: some View {
        content(window)
    }
}
