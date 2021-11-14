//
//  AppDelegate.swift
//  Back Button Bug
//
//  Created by bunnyhero on 2021-11-12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Self.swizzleAddGestureRecognizer()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

private extension AppDelegate {
    static func swizzleAddGestureRecognizer() {
        guard
            let originalMethod = class_getInstanceMethod(UIView.self, #selector(UIView.addGestureRecognizer(_:))),
            let newMethod = class_getInstanceMethod(UIView.self, #selector(UIView.myAddGestureRecognizer(_:)))
        else {
            return
        }
        method_exchangeImplementations(originalMethod, newMethod)
    }
}

extension UIView {
    @objc func myAddGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        // Don't add so many tap gesture recognizers to back buttons
        if accessibilityIdentifier == "BackButton" &&
            gestureRecognizer is UITapGestureRecognizer &&
            (gestureRecognizers?.count ?? 0) > 50 // Arbitrary maximum, set way high just in case
        {
            return
        }
        self.myAddGestureRecognizer(gestureRecognizer) // This calls the original, since they got swapped
    }
}
