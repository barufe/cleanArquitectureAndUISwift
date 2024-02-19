//
//  CryptoListView.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 16/02/24.
//

import SwiftUI

struct CryptoListView: View {
    @ObservedObject private var viewModel: CryptoListViewModel
    @State private var searchCrypto: String = ""
    
    init(viewModel: CryptoListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            if viewModel.showLoadingSpinner{
                ProgressView()
                    .progressViewStyle(.circular)
            }else{
                if viewModel.showErrorMessage == nil {
                    NavigationStack{
                        List {
                            ForEach(viewModel.cryptos, id: \.id) { crypto in
                                CryptoListBasicInfoItemView(item: crypto)
                                }
                            }
                        }.searchable(text: $searchCrypto).onChange(of: searchCrypto){ newValue in
                            viewModel.search(crypto: newValue)
                            
                        }
                }
                else{
                    Text(viewModel.showErrorMessage!)
                    }
                }
            }.onAppear {
                viewModel.onAppear()
            }
    }
}
