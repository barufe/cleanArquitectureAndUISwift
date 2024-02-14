//
//  CryptoCurrencyPriceHistoryRepository.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 13/02/24.
//

import Foundation

class CryptoCurrencyPriceHistoryRepository: CryptocurrencyPriceHistoryRepositoryType{
    private let apiDataSource: ApiPriceDataSourceType
    private let domainMapper: CryptocurrencyPriceHistoryDomainMapper
    private let errorMapper: CryptocurrencyDomainErrorMapper
    
    init(apiDataSource: ApiPriceDataSourceType, domainMapper: CryptocurrencyPriceHistoryDomainMapper, errorMapper: CryptocurrencyDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.domainMapper = domainMapper
        self.errorMapper = errorMapper
    }
    func getPriceHistory(id: String, days: Int) async -> Result<CryptocurrencyPriceHistory, CryptocurrencyDomainError> {
        let result = await apiDataSource.getPriceHistory(id: id, days: days)
        guard case .success(let priceHistory) = result else {
            return .failure(errorMapper.map(error: result.failureValue as? HTTPClientError))
        }
        return .success(domainMapper.map(priceHistoryDTO: priceHistory))
    }
}
