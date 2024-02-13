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
            if viewModel.showLoadingSpinner{
                ProgressView()
                    .progressViewStyle(.circular)
            }else{
                if viewModel.showErrorMessage == nil {
                    List {
                        ForEach(viewModel.cryptos, id: \.id) { crypto in
                            CryptoListItemView(item: crypto)
                            }
                        }
                    }
                else{
                    Text(viewModel.showErrorMessage!)
                    }
                }
            }.onAppear {
                viewModel.onAppear()
            }.refreshable{
                viewModel.onAppear()
            }
    }
}
