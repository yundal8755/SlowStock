//
//  MainTabBarCoordinator.swift
//  SlowStock
//
//  Created by mac on 9/28/26.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = MainTabBarController()
        
        let homeVc = HomeViewController()
        let likeVc = LikeViewController()
        
        tabBarController.setVCs([
            VCModel(vc: homeVc, caseOf: .home),
            VCModel(vc: likeVc, caseOf: .like)
        ])
        
        navigationController?.viewControllers = [tabBarController]
    }
}
