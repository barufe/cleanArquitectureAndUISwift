//
//  CryptoDetailHeaderView.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 14/02/24.
//

import SwiftUI

struct CryptoDetailHeaderView: View {
    private let cryptocurrency: CryptoPresentableItem
    init(cryptocurrency: CryptoPresentableItem) {
        self.cryptocurrency = cryptocurrency
    }
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(cryptocurrency.name)
                        .font(.title)
                    Text(cryptocurrency.symbol)
                        .font(.title)
                }
                Spacer()
                
                VStack(alignment: .trailing){
                    Text(cryptocurrency.price)
                        .font(.title)
                    Text((cryptocurrency.isPriceChangePositive ? "+" : "") + cryptocurrency.price24h)
                        .font(.headline)
                        .foregroundStyle(cryptocurrency.isPriceChangePositive ? .green : .red)
                }.padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 0))
            }
            HStack{
                Text("Cap. de mercado")
                    .font(.headline)
                Spacer()
                Text(cryptocurrency.marketCap)
                    .font(.headline)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            HStack{
                Text("Volumen en 24h:")
                    .font(.headline)
                Spacer()
                Text(cryptocurrency.volume24)
                    .font(.headline)
            }
        }
    }
}

