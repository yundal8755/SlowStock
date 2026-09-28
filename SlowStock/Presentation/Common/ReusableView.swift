//
//  ReusableView.swift
//  SlowStock
//
//  Created by mac on 9/28/26.
//

import Foundation
import UIKit

protocol ReusableView: NSObject {
    static var identifier: String { get }
}

extension ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}

