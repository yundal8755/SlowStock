//
//  StockCell.swift
//  SlowStock
//
//  Created by mac on 9/18/26.
//

import SnapKit
import UIKit

final class StockCell: UITableViewCell {

    private let tickerLabel = UILabel()
    private let priceLabel = UILabel()
    private let changeLabel = UILabel()
    private let favoriteBtn = UIButton(type: .system)

    var onFavoriteTapped: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
        configureLayout()
        configureAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        onFavoriteTapped = nil
    }
}

// MARK: Core Logic
extension StockCell {

    private func configureUI() {
        selectionStyle = .none
        backgroundColor = AppColor.background

        tickerLabel.font = AppTypography.ticker
        tickerLabel.textColor = AppColor.text

        priceLabel.font = AppTypography.price
        priceLabel.textColor = AppColor.text
        priceLabel.textAlignment = .right

        changeLabel.font = AppTypography.change
        changeLabel.textAlignment = .right

        favoriteBtn.accessibilityLabel = "관심 종목"

        contentView.addSubview(tickerLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(changeLabel)
        contentView.addSubview(favoriteBtn)
    }

    private func configureLayout() {
        tickerLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }

        favoriteBtn.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(44)
        }

        changeLabel.snp.makeConstraints {
            $0.trailing.equalTo(favoriteBtn.snp.leading).offset(-8)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(80)
        }

        priceLabel.snp.makeConstraints {
            $0.trailing.equalTo(changeLabel.snp.leading).offset(-8)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(100)
        }
    }

    private func configureAction() {

        favoriteBtn.addAction(
            UIAction { [weak self] _ in
                self?.onFavoriteTapped?()
            },
            for: .touchUpInside
        )
    }

    func configure(with stockData: StockData) {
        tickerLabel.text = stockData.ticker
        priceLabel.text = stockData.price
        changeLabel.text = stockData.change

        changeLabel.textColor = stockData.isPositive ? AppColor.gain : AppColor.loss

        favoriteBtn.setImage(stockData.isFavorite ? .iconStarFilled : .iconStar, for: .normal)
        favoriteBtn.tintColor = stockData.isFavorite ? AppColor.favorite : AppColor.secondaryText
        favoriteBtn.isSelected = stockData.isFavorite
    }
}
