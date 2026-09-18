//
//  HomeStockCell.swift
//  SlowStock
//
//  Created by mac on 9/18/26.
//

import UIKit

final class HomeStockCell: UITableViewCell {
    static let identifier = "HomeStockCell"
    
    private let tickerLabel = UILabel()
    private let priceLabel = UILabel()
    private let changeLabel = UILabel()
    private let favoriteBtn = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UI Logic

extension HomeStockCell {
    
    private func configureUI() {}
    
    private func configureLayout() {}

}
