import UIKit

// MARK: - UIViewController ()

extension UIViewController {

    // MARK: - Internal Methods

    func findLastPresentedViewController() -> UIViewController? {
        guard let presentedViewController = presentedViewController?.presentedViewController else {
            return presentedViewController
        }
        return presentedViewController.findLastPresentedViewController()
    }

    func findNestedNavigationController() -> UINavigationController? {
        if let lastPresentedViewController = findLastPresentedViewController() {
            return lastPresentedViewController.findNestedNavigationController()
        }

        if let nvc = self as? UINavigationController {
            return nvc
        } else if let tbc = self as? UITabBarController {
            return tbc.selectedViewController?.findNestedNavigationController()
        }

        for child in children {
            return child.findNestedNavigationController()
        }

        return nil
    }

    func findNestedTabBarController() -> UITabBarController? {
        if let lastPresentedViewController = findLastPresentedViewController() {
            return lastPresentedViewController.findNestedTabBarController()
        }

        if let tbc = self as? UITabBarController {
            return tbc
        }

        for child in children { return child.findNestedTabBarController() }

        return nil
    }
}
