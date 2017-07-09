//
//  AppDelegate.swift
//  RxGitHubSearch
//
//  Created by Suyeol Jeon on 10/07/2017.
//  Copyright © 2017 Suyeol Jeon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.backgroundColor = .white
    window.makeKeyAndVisible()

    let githubService = GitHubService()
    let viewController = GitHubSearchViewController(githubService: githubService)
    let navigationController = UINavigationController(rootViewController: viewController)
    window.rootViewController = navigationController

    self.window = window
    return true
  }
}
