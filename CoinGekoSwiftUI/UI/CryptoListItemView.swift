//
//  CryptoListItemView.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 12/02/24.
//

import SwiftUI

struct CryptoListItemView: View {
    let item : CryptoPresentableItem
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading){
                    Text(item.name)
                        .font(.title3)
                        .lineLimit(1)
                    Text(item.symbol)
                        .font(.headline)
                }
                Spacer()
                
                VStack(alignment: .trailing){
                    Text(item.price)
                        .font(.title3)
                        .lineLimit(1)
                    Text((item.isPriceChangePositive ? "+" : "") + item.price24h)
                        .font(.headline)
                        .foregroundColor(item.isPriceChangePositive ? .green : .red)
                }
            }
            
            HStack{
                VStack(alignment: .leading){
                    Text("Market cap:")
                        .font(.system(size: 10))
                    Text("24 h")
                        .font(.system(size: 10))
                }
                Spacer()
                
                VStack(alignment: .leading){
                    Text(item.marketCap)
                        .font(.system(size: 10))
                    Text(item.volume24)
                        .font(.system(size: 10))
                }
            }
        }
    }
}

#Preview {
    CryptoListItemView(item: item)
}
let domainModel = Cryptocurrency(id: "btc",
                                 name: "Bitcoin",
                                 symbol: "btc",
                                 price: 24000.43,
                                 price24h: 1.23,
                                 volume24: 3400000000,
                                 marketCap: 1340000000)
let item = CryptoPresentableItem(domainModel: domainModel)
