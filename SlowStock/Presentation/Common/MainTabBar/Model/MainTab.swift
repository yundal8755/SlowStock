//
//  MainTab.swift
//  SlowStock
//
//  Created by mac on 9/28/26.
//

import UIKit

struct VCModel {
    let vc: UIViewController
    let caseOf: MainTabBarControllerCase
}

enum MainTabBarControllerCase {
    case home
    case like

    var title: String {
        switch self {
        case .home:
            return "홈"

        case .like:
            return "좋아요"
        }
    }

    var image: UIImage? {
        switch self {
        case .home:
            return .homeEmpty
        case .like:
            return .heartEmpty
        }
    }

    var selectedImage: UIImage? {
        switch self {
        case .home:
            return .homeFilled
        case .like:
            return .heartFilled
        }
    }
}


