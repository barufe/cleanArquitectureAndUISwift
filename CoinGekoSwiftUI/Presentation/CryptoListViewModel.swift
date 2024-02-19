//
//  CryptoListViewModel.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 16/02/24.
//

import Foundation
struct CryptoListBasicPresentableItem {
    let id: String
    let name: String
    let symbol: String
}

class CryptoListViewModel:ObservableObject {
    private let getCryptoList: GetCryptoListType
    private let errorMapper: CryptocurrencyPresentableErrorMapper
    private let searchCryptoListType: ShearchCryptoListType
    @Published var cryptos : [CryptoListBasicPresentableItem] = []
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    
    init(getCryptoList: GetCryptoListType,errorMapper: CryptocurrencyPresentableErrorMapper, searchCryptoListType: ShearchCryptoListType) {
        self.errorMapper = errorMapper
        self.getCryptoList = getCryptoList
        self.searchCryptoListType = searchCryptoListType
    }
    func onAppear(){
        showLoadingSpinner = true
        Task {
            let result = await getCryptoList.execute()
            handleResult(result)
        }
    }
    func search(crypto: String) {
        Task {
            let result = await searchCryptoListType.execute(crypto: crypto)
            handleResult(result)
        }

    }
    
    private func handleResult(_ result: Result<[CryptocurrencyBasicInfo], CryptocurrencyDomainError>){
        guard case .success(let cryptos) = result else {
            handleError(error: result.failureValue as? CryptocurrencyDomainError)
                return
        }
        let cryptosPresentable = cryptos.map {CryptoListBasicPresentableItem(id: $0.id, name: $0.name, symbol: $0.symbol)}
            Task { @MainActor in
            showLoadingSpinner = false
            self.cryptos = cryptosPresentable
                
        }
    }
    
    private func handleError(error: CryptocurrencyDomainError?){
        Task { @MainActor in
            showLoadingSpinner = false
            showErrorMessage = errorMapper.map(error: error)
        }
    }
}
