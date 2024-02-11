//
//  GlobalCryptoListFactory.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 8/02/24.
//

import Foundation

class GlobalCryptoListFactory {
    static func create() -> GlobalCryptoListView {
        print("Entre en create")
        return GlobalCryptoListView(viewModel: createViewModel())
    }
    private static func createViewModel() -> GlobalCryptoListViewModel{
        print("Entre en createViewModel")
        return GlobalCryptoListViewModel(getGlobalCryptoList: createUsesCase())
    }
    
    private static func createUsesCase() -> GetGlobalCryptoListType{
        print("Entre en createUsesCase")
        return GetGlobalCryptoList(repository: createRepository())
    }
    private static func createRepository() -> GlobalCryptoListRepsitoryType{
        print("Entre en createRepository")
        return CrytocurrencyRepository(apiDatasource: createDataSource(),
                                       errorMapper: CryptocurrencyDomainErrorMapper(),
                                       domainMapper: CryptocurrencyDomainMapper())
    }
    
    private static func createDataSource()-> ApiDataSourceType{
        
        print("Entre en createDataSource")
        let httpClient = URLSessionHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())
        return APICryptoDataSource(httpClient: httpClient)
    }
}
