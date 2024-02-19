//
//  CryptoDetailViewModel.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 14/02/24.
//

import Foundation

class CryptoDetailViewModel:ObservableObject {
    @Published var dataPoints: [ChartDataPoint] = []
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    private let getPriceHistory: GetPriceHistory
    private let errorMapper: CryptocurrencyPresentableErrorMapper
    let cryptocurrency: CryptoPresentableItem
    
    init(getPriceHistory: GetPriceHistory, errorMapper: CryptocurrencyPresentableErrorMapper, cryptocurrency: CryptoPresentableItem) {
        self.getPriceHistory = getPriceHistory
        self.errorMapper = errorMapper
        self.cryptocurrency = cryptocurrency
    }
    
    func getPriceHistory(option: DaysOption){
        showErrorMessage = nil
        showLoadingSpinner = true
        Task {
            let result = await getPriceHistory.execute(id: cryptocurrency.id, days: option.toInt())
            
            guard case .success(let priceHistory) = result else {
                handleError(error: result.failureValue as? CryptocurrencyDomainError)
                return
            }
            
            let dataPoints = priceHistory.prices.map { ChartDataPoint(date: $0.date, price: $0.price)}
                Task { @MainActor in
                    self.showLoadingSpinner = false
                    self.dataPoints = dataPoints
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
