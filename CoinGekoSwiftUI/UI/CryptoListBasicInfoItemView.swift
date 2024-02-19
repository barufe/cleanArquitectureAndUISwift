//
//  CryptoListBasicInfoItemView.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 16/02/24.
//

import SwiftUI

struct CryptoListBasicInfoItemView: View {
    let item : CryptoListBasicPresentableItem
    
    var body: some View {
        VStack {
            HStack{
                Text(item.name)
                    .font(.title3)
                    .lineLimit(1)
                Spacer()
                Text(item.symbol)
                    .font(.headline)
            }.padding()
        }
    }
}
