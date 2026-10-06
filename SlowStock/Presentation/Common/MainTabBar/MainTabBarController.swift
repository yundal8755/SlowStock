//
//  MainTabBarController.swift
//  SlowStock
//
//  Created by mac on 9/28/26.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .systemGray
    }

}

extension MainTabBarController {
    func setVCs(_ vc: [VCModel]) {
        vc.forEach { item in
            item.vc.tabBarItem = UITabBarItem(
                title: item.caseOf.title,
                image: item.caseOf.image,
                selectedImage: item.caseOf.selectedImage,
            )
        }
        self.viewControllers = vc.map { $0.vc }

    }
}
