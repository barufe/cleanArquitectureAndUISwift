//
//  CryptoPresentableItem.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 13/02/24.
//

import Foundation

struct CryptoPresentableItem {
    let id: String
    let name: String
    let symbol: String
    let price: String
    let price24h: String
    let volume24: String
    let marketCap: String
    let isPriceChangePositive: Bool
    
    init(domainModel: Cryptocurrency){
        self.id = domainModel.id
        self.name = domainModel.name
        self.symbol = domainModel.symbol
        self.price = "\(domainModel.price) $"
        self.price24h = domainModel.price24h != nil ? "\(domainModel.price24h!) %" : "-"
        self.volume24 = domainModel.volume24 != nil ? "\(domainModel.volume24!) $" : "-"
        self.marketCap = "\(domainModel.marketCap) $"
        self.isPriceChangePositive = (domainModel.price24h ?? 0) >= 0
    }
}
