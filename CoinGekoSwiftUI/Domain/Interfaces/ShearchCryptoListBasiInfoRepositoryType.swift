//
//  ShearchCryptoListBasiInfoRepositoryType.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 18/02/24.
//

import Foundation

protocol ShearchCryptoListBasiInfoRepositoryType{
    func seach(crypto:String) async -> Result<[CryptocurrencyBasicInfo], CryptocurrencyDomainError>
}
