//
//  CryptoListBasicInfoRepositoryType.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 16/02/24.
//

import Foundation

protocol CryptoListBasicInfoRepositoryType{
    func getCryptoList() async -> Result<[CryptocurrencyBasicInfo], CryptocurrencyDomainError>
}
