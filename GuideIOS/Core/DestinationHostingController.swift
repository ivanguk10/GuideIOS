import SwiftUI

// MARK: - DestinationHostingController

final class DestinationHostingController<T: View>: UIHostingController<T> {

    // MARK: - Life Cycle

    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        guard parent == nil else { return }

        let itemsInStackCount = navigationController?.children.count ?? 0
        if itemsInStackCount > 2, navigationController?.children[itemsInStackCount - 2].toolbarItems?.isEmpty == false {
            navigationController?.isToolbarHidden = false
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true

        let configuration: NavigationBarTitleConfiguration? = Mirror.reflectProperties(of: rootView, recursively: true)

        if let configuration = configuration {
            navigationItem.title = configuration.title
            navigationItem.largeTitleDisplayMode = configuration.displayMode.uiDisplayMode
        }
    }
   
}

// MARK: - Mirror ()

extension Mirror {

    // MARK: - Static Methods

    static func reflectProperties<T>(
        of target: Any,
        matchingType type: T.Type = T.self,
        recursively: Bool = false
    ) -> T? {
        let mirror = Mirror(reflecting: target)

        for child in mirror.children {
            if let value = child.value as? T { return value }

            if recursively {
                // To enable recursive reflection, all we have to do
                // is to call our own method again, using the value
                // of each child, and using the same method.
                return Mirror.reflectProperties(of: child.value, recursively: true)
            }
        }

        return nil
    }
}
