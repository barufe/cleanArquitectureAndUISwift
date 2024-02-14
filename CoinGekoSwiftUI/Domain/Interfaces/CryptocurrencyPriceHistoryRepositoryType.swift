//
//  CryptocurrencyPriceHistoryRepositoryType.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 13/02/24.
//

import Foundation

protocol CryptocurrencyPriceHistoryRepositoryType {
    func getPriceHistory(id: String, days: Int) async -> Result<CryptocurrencyPriceHistory, CryptocurrencyDomainError>
}
