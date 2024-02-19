//
//  CacheCryptoCurrencyBasicInfoDataSourceType.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 16/02/24.
//

import Foundation

protocol CacheCryptoCurrencyBasicInfoDataSourceType {
    func getCryptoList() async -> [CryptocurrencyBasicInfo]
    func saveCryptoList(_ cryptoList: [CryptocurrencyBasicInfo]) async
}
