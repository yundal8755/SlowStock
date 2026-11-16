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

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppColor.background
        appearance.shadowColor = AppColor.separator

        let itemAppearances = [
            appearance.stackedLayoutAppearance,
            appearance.inlineLayoutAppearance,
            appearance.compactInlineLayoutAppearance
        ]
        for itemAppearance in itemAppearances {
            itemAppearance.normal.iconColor = AppColor.secondaryText
            itemAppearance.normal.titleTextAttributes = [
                .font: AppTypography.tabLabel,
                .foregroundColor: AppColor.secondaryText
            ]
            itemAppearance.selected.iconColor = AppColor.selection
            itemAppearance.selected.titleTextAttributes = [
                .font: AppTypography.selectedTabLabel,
                .foregroundColor: AppColor.selection
            ]
        }

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = AppColor.selection
        tabBar.unselectedItemTintColor = AppColor.secondaryText
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
