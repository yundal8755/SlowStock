//
//  HomeViewController.swift
//  SlowStock
//
//  Created by mac on 9/16/26.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    private var stockData: [StockData] = [
        StockData(
            ticker: "AAPL",
            price: "$227.82",
            change: "+1.24%",
            isPositive: true
        ),
        StockData(
            ticker: "MSFT",
            price: "$416.28",
            change: "+0.73%",
            isPositive: true
        ),
        StockData(
            ticker: "AMZN",
            price: "$201.12",
            change: "-0.42%",
            isPositive: false
        )
    ]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(homeView)

        configureDataSource()
        
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        updateStocks(self.stockData)
    }
    
    func updateStocks(_ stockData: [StockData]) {
        self.stockData = stockData
        homeView.stockTableView.reloadData()
    }
    
    private func configureDataSource() {
        homeView.stockTableView.dataSource = self
        
        homeView.stockTableView.register(
            HomeStockCell.self,
            forCellReuseIdentifier: HomeStockCell.identifier
        )
    }
}


// MARK: - DataSource

extension HomeViewController: UITableViewDataSource {

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
            withIdentifier: HomeStockCell.identifier,
            for: indexPath
        ) as! HomeStockCell

        cell.configure(with: stockData[indexPath.row])

        return cell
    }
}
