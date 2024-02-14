//
//  CryptocurrencyPriceHistoryDomainMapper.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 14/02/24.
//

import Foundation

class CryptocurrencyPriceHistoryDomainMapper{
    func map(priceHistoryDTO: CryptocurrencyPriceHistoryDTO) -> CryptocurrencyPriceHistory{
        let dataPoints: [CryptocurrencyPriceHistory.DataPoint] = priceHistoryDTO.prices.compactMap{ dataPoint in
            guard dataPoint.count >= 2,
                    let date = tiemstampToDate(dataPoint[0]),
                    let price = dataPoint[1].toCurrency() else {return nil}
            
            return CryptocurrencyPriceHistory.DataPoint(price: price, date: date)
        }
        return CryptocurrencyPriceHistory(prices: dataPoints)
    }
    
    private func tiemstampToDate(_ timestamp: Double) -> Date? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: Date(timeIntervalSince1970: (timestamp / 1000)))
        guard let date = calendar.date(from: components) else {return nil}
        return date
    }
}
