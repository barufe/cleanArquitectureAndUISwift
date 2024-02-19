//
//  CryptocurrencyBasicInfoRepository.swift
//  CoinGekoSwiftUI
//
//  Created by Germain Seijas on 16/02/24.
//

import Foundation

class CryptocurrencyBasicInfoRepository: CryptoListBasicInfoRepositoryType{
    private let apiDatasource : ApiCryptoCurrencyBasicInfoDataSourceType
    private let errorMapper: CryptocurrencyDomainErrorMapper
    private let cacheDataSource: CacheCryptoCurrencyBasicInfoDataSourceType
    
    init(apiDatasource: ApiCryptoCurrencyBasicInfoDataSourceType, errorMapper: CryptocurrencyDomainErrorMapper, cacheDataSource: CacheCryptoCurrencyBasicInfoDataSourceType) {
        self.apiDatasource = apiDatasource
        self.errorMapper = errorMapper
        self.cacheDataSource = cacheDataSource
    }
    
    func getCryptoList() async -> Result<[CryptocurrencyBasicInfo], CryptocurrencyDomainError> {
        let cryptoListCache = await cacheDataSource.getCryptoList()
        
        if !cryptoListCache.isEmpty {
            return .success(cryptoListCache)
        }
        
        let cryptoListResult = await apiDatasource.getCryptoList()
        guard case .success(let cryptoList) = cryptoListResult else {
            return .failure(errorMapper.map(error: cryptoListResult.failureValue as? HTTPClientError))
        }
        
        let cryptoListDomain = cryptoList.map { CryptocurrencyBasicInfo(id: $0.id, name: $0.name, symbol: $0.symbol)
        }
        
        await cacheDataSource.saveCryptoList(cryptoListDomain)
        
        return .success(cryptoListDomain)
    }
}

extension CryptocurrencyBasicInfoRepository: ShearchCryptoListBasiInfoRepositoryType{
    func seach(crypto: String) async -> Result<[CryptocurrencyBasicInfo], CryptocurrencyDomainError> {
        let result = await getCryptoList()
        
        guard case .success(let cryptoList) = result else {
            return result
        }
        guard crypto != "" else{
            return result
        }
        let filterCryptoList = cryptoList.filter{ $0.name.lowercased().contains(crypto.lowercased()) || $0.symbol.lowercased().contains(crypto.lowercased())}
        
        return .success(filterCryptoList)
    }
}
