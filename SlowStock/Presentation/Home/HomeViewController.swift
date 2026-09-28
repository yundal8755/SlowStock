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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureLayout()
        
        func updateStocks(_ stockData: [StockData]) {
            self.stockData = stockData
            homeView.stockTableView.reloadData()
        }
    }
}


// MARK: - Core Logics

extension HomeViewController {
    
    private func configureUI() {
        
        view.addSubview(homeView)
        
        configureDataSource()
    }
    
    private func configureLayout() {
        
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
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
