//
//  DummyStockStore.swift
//  SlowStock
//
//  Created by mac on 10/6/26.
//

import Foundation

final class DummyStockStore {
    
    static let shared = DummyStockStore()
    
    private init() {}
    
    private(set) var stocks: [StockData] = [
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
    
    var favoriteStocks: [StockData] {
        stocks.filter { $0.isFavorite }
    }
    
    func toggleFavorite(ticker: String) {
        // firstIndex: 동일한 ticker가 여러 개라면 첫 번째 항목만 찾음
        guard let index = stocks.firstIndex(
            where: { $0.ticker == ticker }
        ) else {
            return
        }

        stocks[index].isFavorite.toggle()
    }
}
