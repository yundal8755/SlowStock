//
//  AppCoordinator.swift
//  SlowStock
//
//  Created by mac on 9/28/26.
//

import UIKit

enum AppFlow {
    case home
    case favorite
    case setting
}

final class AppCoordinator: Coordinator {
    // MARK: Internal pp
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController? { rootNavController }
    
    // MARK: Private pp
    private let rootNavController: UINavigationController
    private weak var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
        self.rootNavController = UINavigationController()
    }
    
    func start() {
        let vc = MainTabBarController()
        
        rootNavController.setNavigationBarHidden(true, animated: false)
        rootNavController.setViewControllers([vc], animated: false)
        
        window?.rootViewController = rootNavController

        let mainTabCoordinator = MainTabBarCoordinator(navigationController: rootNavController)
        childCoordinators.removeAll()
        addChild(mainTabCoordinator)
        
        mainTabCoordinator.start()
    }
}
