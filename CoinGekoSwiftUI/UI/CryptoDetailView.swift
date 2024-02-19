//
//  CryptoDetailView.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 14/02/24.
//

import SwiftUI
import Charts

struct CryptoDetailView: View {
    @ObservedObject private var viewModel: CryptoDetailViewModel
    @State private var selectedItem: DaysOption = .month
    
    init(viewModel: CryptoDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack{
            VStack{
                CryptoDetailHeaderView(cryptocurrency: viewModel.cryptocurrency)
                Chart(viewModel.dataPoints) {
                    LineMark(x: .value("Fecha", $0.date),
                             y: .value("Precio", $0.price))
                }
                Picker("", selection: $selectedItem){
                    ForEach(DaysOption.allCases, id: \.self){ opcion in
                        Text(opcion.rawValue)
                        
                    }
                }.onChange(of:selectedItem) {
                    print(selectedItem)
                    viewModel.getPriceHistory(option: selectedItem)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .onAppear{
                viewModel.getPriceHistory(option: selectedItem)
            }
            if viewModel.showLoadingSpinner {
                ProgressView()
                    .progressViewStyle(.circular)
            }else if let errorMessage = viewModel.showErrorMessage {
                VStack{
                    Text(errorMessage)
                    Button("Try again") {
                        viewModel.getPriceHistory(option: selectedItem)
                    }
                }
            }
        }
        
    }
}
