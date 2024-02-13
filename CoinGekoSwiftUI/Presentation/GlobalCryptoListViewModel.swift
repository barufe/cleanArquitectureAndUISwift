//
//  GlobalCryptoListViewModel.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 8/02/24.
//

import Foundation

class GlobalCryptoListViewModel: ObservableObject {
    private let getGlobalCryptoList: GetGlobalCryptoListType
    private let errorMapper: CryptocurrencyPresentableErrorMapper
    @Published var cryptos : [CryptoPresentableItem] = []
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    
    init(getGlobalCryptoList: GetGlobalCryptoListType, errorMapper: CryptocurrencyPresentableErrorMapper){
        self.getGlobalCryptoList = getGlobalCryptoList
        self.errorMapper = errorMapper
    }
    func onAppear(){
        showLoadingSpinner = true
        Task {
            let result = await getGlobalCryptoList.execute()
            guard case .success(let cryptos) = result else {
                handleError(error: result.failureValue as? CryptocurrencyDomainError)
                    return
            }
                let cryptosPresentable = cryptos.map {CryptoPresentableItem(domainModel: $0)}
                Task { @MainActor in
                showLoadingSpinner = false
                self.cryptos = cryptosPresentable
                    
            }
        }
    }
    private func handleError(error: CryptocurrencyDomainError?){
        Task { @MainActor in
            showLoadingSpinner = false
            showErrorMessage = errorMapper.map(error: error)
        }
    }
}


