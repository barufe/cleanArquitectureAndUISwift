//
//  ContentView.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 8/02/24.
//

import SwiftUI

struct ContentView: View {
    let globalCryptoList: GlobalCryptoListView
    let cryptoListView: CryptoListView
    
    var body: some View {
        TabView {
            globalCryptoList.tabItem {
                Label("Global", systemImage: "list.dash")
            }
            cryptoListView.tabItem {
                Label("CryptoList", systemImage: "list.dash")
            }
        }
        .padding()
    }
}
