//
//  CryptocurrencyPriceHistoryDTO.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 13/02/24.
//

import Foundation

struct CryptocurrencyPriceHistoryDTO: Codable {
    let prices: [[Double]]
    
    enum CodingKeys: String, CodingKey{
        case prices = "prices"
    }
}
