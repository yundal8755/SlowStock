//
//  AppTypography.swift
//  SlowStock
//
//  Created by yundal on 11/16/26.
//

import UIKit

enum AppTypography {
    static var title: UIFont { font(.bold, size: 24) }
    static var ticker: UIFont { font(.bold, size: 20) }
    static var price: UIFont { font(.medium, size: 18) }
    static var change: UIFont { font(.semiBold, size: 18) }
    static var caption: UIFont { font(.regular, size: 12) }
    static var tabLabel: UIFont { font(.medium, size: 10) }
    static var selectedTabLabel: UIFont { font(.semiBold, size: 10) }

    private enum Weight: String {
        case regular = "Regular"
        case medium = "Medium"
        case semiBold = "SemiBold"
        case bold = "Bold"

        var system: UIFont.Weight {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            case .semiBold: return .semibold
            case .bold: return .bold
            }
        }
    }

    private static func font(_ weight: Weight, size: CGFloat) -> UIFont {
        UIFont(name: "Pretendard-\(weight.rawValue)", size: size)
            ?? .systemFont(ofSize: size, weight: weight.system)
    }
}
