//
//  CryptocurrencyDomainMapper.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 7/02/24.
//

import Foundation

class CryptocurrencyDomainMapper {
    func getCryptoCurrencyBuilderList(symbolList: [String], cryptoList: [CryptocurrencyBasicDTO]) -> [CryptocurrencyBuilder]{
        var symbolListDic = [String: Bool]()
        symbolList.forEach{symbol in
            symbolListDic[symbol] = true
        }
        
        let globalCryptoList = cryptoList.filter{ symbolListDic[$0.symbol] ?? false}
        let cryptocurrencyBuilderList = globalCryptoList.map{CryptocurrencyBuilder(id: $0.id, name: $0.name, symbol: $0.symbol)}
        return cryptocurrencyBuilderList
    }
    
    func map(cryptocurrencyBuilderList:[CryptocurrencyBuilder], priceInfo: [String: CryptocurrencyPriceInfoDTO]) -> [Cryptocurrency]{
        cryptocurrencyBuilderList.forEach{ cryptocurrencyBuilder in
            if let priceInfo = priceInfo[cryptocurrencyBuilder.id]{
                cryptocurrencyBuilder.price = priceInfo.usd
                cryptocurrencyBuilder.volume24 = priceInfo.usd24HVol
                cryptocurrencyBuilder.price24h = priceInfo.usd24HChange
                cryptocurrencyBuilder.marketCap = priceInfo.usdMarketCap
                
            }
        }
        
        return cryptocurrencyBuilderList.compactMap{$0.build()}
    }
}
