//
//  CryptoDetailFactory.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 14/02/24.
//

import Foundation

class CryptoDetailFactory:CreateCryptoDetailView {
    func create(cryptocurrency: CryptoPresentableItem) -> CryptoDetailView {
        return CryptoDetailView(viewModel: createViewModel(cryptocurrency: cryptocurrency))
    }
    private func createViewModel(cryptocurrency: CryptoPresentableItem) -> CryptoDetailViewModel{
        return CryptoDetailViewModel(getPriceHistory: createUseCase(),
                                     errorMapper: CryptocurrencyPresentableErrorMapper(), 
                                     cryptocurrency: cryptocurrency)
    }
    private func createUseCase() -> GetPriceHistory{
        return GetPriceHistory(repository: createRepository())
    }
    private func createRepository() -> CryptocurrencyPriceHistoryRepositoryType{
        return CryptoCurrencyPriceHistoryRepository(apiDataSource: createDataSource(),
                                                    domainMapper: CryptocurrencyPriceHistoryDomainMapper(),
                                                    errorMapper: CryptocurrencyDomainErrorMapper())
    }
    private func createDataSource() -> ApiPriceDataSourceType{
        return ApiPriceDataSource(httpClient: createHTTPClient())
    }
    
    private func createHTTPClient() -> HTTPClient{
        return URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
}
