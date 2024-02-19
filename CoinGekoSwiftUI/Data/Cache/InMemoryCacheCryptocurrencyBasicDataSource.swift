//
//  InMemoryCacheCryptocurrencyBasicDataSource.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 16/02/24.
//

import Foundation

actor InMemoryCacheCryptocurrencyBasicDataSource: CacheCryptoCurrencyBasicInfoDataSourceType{
    static let shared : InMemoryCacheCryptocurrencyBasicDataSource = InMemoryCacheCryptocurrencyBasicDataSource()
    
    private var cache : [CryptocurrencyBasicInfo] = []
    private init(){}
    func getCryptoList() async -> [CryptocurrencyBasicInfo] {
        return cache
    }
    
    func saveCryptoList(_ cryptoList: [CryptocurrencyBasicInfo]) async {
        self.cache = cryptoList
    }
}
