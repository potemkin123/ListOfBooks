//
//  AppDelegate.swift
//  ListOfBooks
//
//  Created by Владислав Юрченко on 10.09.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = BooksViewController(viewModel: BooksViewModel())
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

