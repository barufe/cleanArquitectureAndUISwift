//
//  ApiCryptoCurrencyBasicInfoDataSourceType.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 16/02/24.
//

import Foundation

protocol ApiCryptoCurrencyBasicInfoDataSourceType {
    func getCryptoList() async -> Result<[CryptocurrencyBasicDTO], HTTPClientError>
}
