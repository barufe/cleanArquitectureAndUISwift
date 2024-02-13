//
//  CryptocurrencyPriceInfoDTO.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 7/02/24.
//

import Foundation

struct CryptocurrencyPriceInfoDTO: Codable {
    var price, volume24, price24h, marketCap: Double?

    init(price: Double? = 0.0, volume24: Double? = 0.0, price24h: Double? = 0.0, marketCap: Double? = 0.0) {
        self.price = price
        self.volume24 = volume24
        self.price24h = price24h
        self.marketCap = marketCap
    }
    enum CodingKeys: String, CodingKey {
        case price = "usd"
        case marketCap = "usd_market_cap"
        case volume24 = "usd_24h_vol"
        case price24h = "usd_24h_change"
    }
}
