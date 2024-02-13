//
//  Foundations+Extensions.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 7/02/24.
//

import Foundation

extension Result {
    var failureValue: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}
extension Double {
    func toCurrency() -> Double?{
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        guard let formattedString = formatter.string(from: self as NSNumber),
              let formattedDouble = Double(formattedString) else {return nil}
        return formattedDouble
    }
}
