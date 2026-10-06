//
//  LikeViewController.swift
//  SlowStock
//
//  Created by mac on 9/28/26.
//

import UIKit
import SnapKit

final class LikeViewController: UIViewController {
    
    private let likeView = LikeView()
    
    private var stockData: [StockData] = [
        StockData(
            ticker: "AAPL",
            price: "$227.82",
            change: "+1.24%",
            isPositive: true,
            isFavorite: true
        ),
        StockData(
            ticker: "MSFT",
            price: "$416.28",
            change: "+0.73%",
            isPositive: true,
            isFavorite: true
        ),
        StockData(
            ticker: "AMZN",
            price: "$201.12",
            change: "-0.42%",
            isPositive: false,
            isFavorite: true
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureLayout()
        configureDataSource()
        likeView.updateFavoriteCount(stockData.count)
    }
}


// MARK: - UI Logic

extension LikeViewController {

    private func configureDataSource() {
        likeView.tableView.dataSource = self
        likeView.tableView.register(
            StockCell.self,
            forCellReuseIdentifier: StockCell.identifier
        )
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(likeView)
    }
    
    private func configureLayout() {
        likeView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension LikeViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        stockData.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: StockCell.identifier,
            for: indexPath
        ) as! StockCell

        cell.configure(with: stockData[indexPath.row])
        cell.onFavoriteTapped = { [weak self, weak cell] in
            guard let self,
                  let cell,
                  let currentIndexPath = self.likeView.tableView.indexPath(for: cell)
            else { return }

            self.stockData[currentIndexPath.row].isFavorite = false
            self.stockData.remove(at: currentIndexPath.row)
            self.likeView.tableView.deleteRows(at: [currentIndexPath], with: .automatic)
            self.likeView.updateFavoriteCount(self.stockData.count)
        }

        return cell
    }
}
