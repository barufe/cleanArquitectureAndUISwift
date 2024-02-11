//
//  CryptocurrencyPriceInfoDTO.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 7/02/24.
//

import Foundation

struct CryptocurrencyPriceInfoDTO: Codable {
    var usd, usdMarketCap, usd24HVol, usd24HChange: Double?

    enum CodingKeys: String, CodingKey {
        case usd
        case usdMarketCap = "usd_market_cap"
        case usd24HVol = "usd_24h_vol"
        case usd24HChange = "usd_24h_change"
    }
}
