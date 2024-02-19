//
//  ChartDataPoint.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 15/02/24.
//

import Foundation

struct ChartDataPoint: Identifiable{
    let id = UUID()
    let date: Date
    let price: Double
}
