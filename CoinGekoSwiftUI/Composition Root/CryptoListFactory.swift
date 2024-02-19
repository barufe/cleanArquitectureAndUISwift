//
//  CryptoListFactory.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 16/02/24.
//

import Foundation

class CryptoListFactory{
    static func create() -> CryptoListView{
        return CryptoListView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> CryptoListViewModel{
        return CryptoListViewModel(getCryptoList: createGetCryptoListUseCase(), errorMapper: CryptocurrencyPresentableErrorMapper(), searchCryptoListType: createShearchCryptoListUseCase())
    }
    private static func createShearchCryptoListUseCase() -> ShearchCryptoListType{
        return ShearchCryptoList(repository: createRepository())
    }
    
    private static func createGetCryptoListUseCase() -> GetCryptoListType{
        return GetCrytoList(repository: createRepository())
    }
    private static func createRepository() -> CryptocurrencyBasicInfoRepository{
        return CryptocurrencyBasicInfoRepository(apiDatasource: createApiDataSource(),
                                          errorMapper: CryptocurrencyDomainErrorMapper(),
                                          cacheDataSource: InMemoryCacheCryptocurrencyBasicDataSource.shared)
    }
    private static func createApiDataSource() -> ApiCryptoCurrencyBasicInfoDataSourceType{
        return APICryptoDataSource(httpClient: createHttpClient())
    }
    private static func createHttpClient() -> HTTPClient{
        return URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(),
                             errorResolver: URLSessionErrorResolver())
    }
}
