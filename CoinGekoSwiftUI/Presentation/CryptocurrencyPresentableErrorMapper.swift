//
//  CryptocurrencyPresentableErrorMapper.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 13/02/24.
//

import Foundation


class CryptocurrencyPresentableErrorMapper {
    func map(error:CryptocurrencyDomainError?) -> String{
        guard error == .toManyRequests else{
            return "Something went wrong"
        }
        return "You have exceeded the limit, try again later"
    }
}
