//
//  APICryptoDataSource.swift
//  CoinGekoiOS
//
//  Created by Germain Seijas on 8/02/24.
//

import Foundation

class APICryptoDataSource: ApiDataSourceType{
    private var httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getGlobalCryptoSymbolList() async -> Result<[String], HTTPClientError> {
        let endpoint = Endpoint(path: "global", queryParameters: [:], method: .get)
        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://api.coingecko.com/api/v3/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let symbolList = try? JSONDecoder().decode(CryptoCurrencyGlobalInfoDTO.self, from: data) else {
            return .failure(.parsingError)
        }
        print("DataSource")
        print(symbolList.data.cryptocurrency)
        return .success(symbolList.data.cryptocurrency.map{
            $0.key
        })
    }
    
    func getCryptoList() async -> Result<[CryptocurrencyBasicDTO], HTTPClientError> {
        let endpoint = Endpoint(path: "coins/list", queryParameters: [:], method: .get)
        let result = await httpClient.makeRequest(endpoint: endpoint,baseUrl: "https://api.coingecko.com/api/v3/")
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        guard let cryptoList = try? JSONDecoder().decode([CryptocurrencyBasicDTO].self, from: data) else {
            return .failure(.parsingError)
        }
        print("DataSource2")
        print(cryptoList[0].id)
        return .success(cryptoList)
    }
    
    func getPriceInfoForCryptos(id: [String]) async -> Result<[String : CryptocurrencyPriceInfoDTO], HTTPClientError> {
        let queryParameters: [String : Any] = [
            "ids" : id.joined(separator: ","),
            "vs_currencies" : "usd",
            "include_market_cap" : true,
            "include_24hr_vol" : true,
            "include_24hr_change" : true
        ]
        
        let endpoint = Endpoint(path: "simple/price",
                                queryParameters: queryParameters,
                                method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseUrl: "https://api.coingecko.com/api/v3/")
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        do {
            let mutableCryptoList = try JSONDecoder().decode([String: CryptocurrencyPriceInfoDTO].self, from: data)
            print("DATA 3")
            print(mutableCryptoList)
            return .success(mutableCryptoList)
        } catch {
            print("Error decoding JSON: \(error)")
            return .failure(.parsingError)
        }
    }
}
private func handleError(error: HTTPClientError?) -> HTTPClientError{
    guard let error = error else {
        return .generic
    }
    return error
}
