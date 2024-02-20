//
//  ShearchCryptoList.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 17/02/24.
//

import Foundation
protocol ShearchCryptoListType{
    func execute(crypto: String) async -> Result<[CryptocurrencyBasicInfo], CryptocurrencyDomainError>
}

class ShearchCryptoList: ShearchCryptoListType {
    private let repository:ShearchCryptoListBasiInfoRepositoryType
    
    init(repository: ShearchCryptoListBasiInfoRepositoryType) {
        self.repository = repository
    }
    
    func execute(crypto: String) async -> Result<[CryptocurrencyBasicInfo], CryptocurrencyDomainError> {
        let result = await repository.seach(crypto: crypto)
        
        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generics)
            }
            return .failure(error)
        }
        return .success(cryptoList.sorted{$0.name < $1.name})
    }
    
    
}
