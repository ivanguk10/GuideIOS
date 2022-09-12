import Combine
import SwiftUI

// MARK: - Navigation

final class Navigation: ObservableObject {

    // MARK: - Internal Properties

    @Published var isTabBarHidden = false
    let window: UIWindow?

    // MARK: - Private Properties
    // MARK: - Life Cycle

    init(window: UIWindow?) {
        self.window = window
    }

    // MARK: - Internal Methods

    func present<Content: View>(_ view: Content, animated: Bool = true) {
        let controller = DestinationHostingController(
            rootView: view
                .environmentObject(self)
        )
        present(controller, animated: animated)
    }

    func present(_ viewController: UIViewController, animated: Bool = true) {
        if let lastPresentedViewController = window?.rootViewController?.findLastPresentedViewController() {
            lastPresentedViewController.present(viewController, animated: animated)
        } else {
            window?.rootViewController?.present(viewController, animated: animated)
        }
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        if let lastPresentedViewController = window?.rootViewController?.findLastPresentedViewController() {
            lastPresentedViewController.dismiss(animated: animated, completion: completion)
        } else {
            window?.rootViewController?.dismiss(animated: animated, completion: completion)
        }
    }

//    func pushView(
//        _ view: Content,
//        animated: Bool = true
//    ) {
//        let view = screenView(screen)
//        let controller = DestinationHostingController(
//            rootView: view
//                .environmentObject(self)
//        )
//        controller.hidesBottomBarWhenPushed = true
//
//        pushViewController(controller, animated: animated)
//    }

    func pushView<Content: View>(_ view: Content, animated: Bool = true) {
        let controller = DestinationHostingController(
            rootView: view
                .environmentObject(self)
        )
        controller.hidesBottomBarWhenPushed = true
        pushViewController(controller, animated: animated)
    }

//    func setRootView(withNavigation: Bool = false) {
//        if withNavigation {
//            let suView = NavigationView {
//                screenView(screen, for: route)
//            }
//            .rootView(navigation: self)
//
//            let controller = DestinationHostingController(rootView: suView)
//            controller.hidesBottomBarWhenPushed = true
//            setRootController(controller)
//        } else {
//            let suView = screenView(screen, for: route)
//                .rootView(navigation: self)
//
//            let controller = DestinationHostingController(rootView: suView)
//            controller.hidesBottomBarWhenPushed = true
//            setRootController(controller)
//        }
//    }

    func setRootView<Content: View>(_ view: Content, withNavigation: Bool = false) {
        if withNavigation {
            let suView = NavigationView {
                view
            }
                .rootView(navigation: self)

            let controller = DestinationHostingController(rootView: suView)
            controller.hidesBottomBarWhenPushed = true
            setRootController(controller)
        } else {
            let suView = view
                .rootView(navigation: self)

            let controller = DestinationHostingController(rootView: suView)
            controller.hidesBottomBarWhenPushed = true
            setRootController(controller)
        }
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        let nvc = window?.rootViewController?.findNestedNavigationController()
        nvc?.pushViewController(viewController, animated: animated)
    }

    func setRootController(_ viewController: UIViewController) {
        guard let window = window else { return }

        window.rootViewController = viewController
        UIView.transition(
            with: window,
            duration: 0.1,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }

    func pop(animated: Bool = true) {
        let nvc = window?.rootViewController?.findNestedNavigationController()
        nvc?.popViewController(animated: animated)
    }

    func setTabBarInsets() {
        let tabBarController = window?.rootViewController?.findNestedTabBarController()
        let count = tabBarController?.tabBar.items?.count ?? 0
        if count == 3 {
            tabBarController?.tabBar.items?[1].imageInsets = .init(top: 7, left: 0, bottom: 0, right: 0)
        }
    }

    func hideTabBar() {
        isTabBarHidden = true
    }

    func showTabBar() {
        isTabBarHidden = false
    }
}
