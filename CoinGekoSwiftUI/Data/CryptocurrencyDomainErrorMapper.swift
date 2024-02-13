//
//  CryptocurrencyDomainErrorMapper.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 7/02/24.
//

import Foundation

class CryptocurrencyDomainErrorMapper {
    func map(error: HTTPClientError?) -> CryptocurrencyDomainError{
        guard error == .tooManyRequests else {
            return .generic
        }
        return .toManyRequests
    }
}
