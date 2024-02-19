//
//  GlobalCryptoListFactory.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 8/02/24.
//

import Foundation

class GlobalCryptoListFactory {
    static func create() -> GlobalCryptoListView {
        return GlobalCryptoListView(viewModel: createViewModel(),
                                    createCryptoDetailView: CryptoDetailFactory())
    }
    private static func createViewModel() -> GlobalCryptoListViewModel{
        return GlobalCryptoListViewModel(getGlobalCryptoList: createUsesCase(), 
                                         errorMapper: CryptocurrencyPresentableErrorMapper())
    }
    
    private static func createUsesCase() -> GetGlobalCryptoListType{
        return GetGlobalCryptoList(repository: createRepository())
    }
    private static func createRepository() -> GlobalCryptoListRepsitoryType{
        return CrytocurrencyRepository(apiDatasource: createDataSource(),
                                       errorMapper: CryptocurrencyDomainErrorMapper(),
                                       domainMapper: CryptocurrencyDomainMapper())
    }
    
    private static func createDataSource()-> ApiDataSourceType{
        let httpClient = URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())
        return APICryptoDataSource(httpClient: httpClient)
    }
}
