//
//  GlobalCryptoListView.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 8/02/24.
//

import SwiftUI

struct GlobalCryptoListView: View {
    @ObservedObject private var viewModel: GlobalCryptoListViewModel
    
    init(viewModel: GlobalCryptoListViewModel) {
        self.viewModel = viewModel
        print("GlobalCryptoListView")
        print(self.viewModel.cryptos.count)
    }
    
    var body: some View {
        VStack{
            List {
                ForEach(viewModel.cryptos, id: \.id) { crypto in
                    Text(crypto.name)
                }
            }.onAppear {
                viewModel.onAppear()
            }
        }
    }
}
