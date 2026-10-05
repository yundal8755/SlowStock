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
    }
}


// MARK: - UI Logic

extension LikeViewController {
    
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
