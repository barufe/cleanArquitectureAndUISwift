//
//  CreateCryptoDetailView.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 15/02/24.
//

import Foundation

protocol CreateCryptoDetailView {
    func create(cryptocurrency: CryptoPresentableItem) -> CryptoDetailView
}
