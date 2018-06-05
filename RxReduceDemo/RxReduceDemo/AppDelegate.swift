//
//  AppDelegate.swift
//  RxReduceDemo
//
//  Created by Wittemberg, Thibault on 18-04-27.
//  Copyright © 2018 Wittemberg, Thibault. All rights reserved.
//

import UIKit
import RxReduce
import RxSwift
import RxCocoa

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let networkService: NetworkService = NetworkService(withBaseUrl: URL(string: "https://api.themoviedb.org/3/")!, andApiKey: "3afafd21270fe0414eb760a41f2620eb")
    let store = Store<AppState>(withReducers: [movieReducer], withMiddlewares: [loggingMiddleware])
    lazy var dependencyContainer: DependencyContainer = {
        return DependencyContainer(withStore: self.store, withNetworkService: self.networkService)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        guard let window = self.window else { return false }

        let mainViewController = MovieListViewController.instantiate(with: self.dependencyContainer)
        window.rootViewController = mainViewController
        window.makeKeyAndVisible()

        return true
    }

}

