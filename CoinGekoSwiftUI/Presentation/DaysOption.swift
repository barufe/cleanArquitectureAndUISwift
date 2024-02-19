//
//  DaysOption.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 15/02/24.
//

import Foundation

enum DaysOption: String, CaseIterable, Equatable {
    case month = "30d"
    case ninty = "90d"
    case hundredeihty = "180d"
    case year = "1a"
    
    func toInt() -> Int {
        switch self{
            case .month:
                return 30
            case .ninty:
                return 90
            case .hundredeihty:
                return 190
            case .year:
                return 365
            }
    }
}
