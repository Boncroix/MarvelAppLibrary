//
//  NetworkHeros.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 1/5/24.
//

import Foundation

//MARK: - Protocol
public protocol NetworkHerosProtocol {
    func getHeros() async throws -> (HerosEntry, [Hero])
}

//MARK: - NetworkHeros
public final class NetworkHeros: NetworkHerosProtocol {
    
    // MARK: Init
    public init() {}
    
    //MARK: GetHeros
    public func getHeros() async throws -> (HerosEntry, [Hero]) {
        
        var heros: [Hero] = []
        
        guard let url = URL(string: "\(ConstApp.API_URL)\(stringEndpoint(endpoint: .heros))?\(ConstApp.LIMIT)&\(ConstApp.TS)&\(ConstApp.PUBLIC_KEY)&\(ConstApp.HASH_MD5)") else {
            throw NetworkError.malformedURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        request.setValue(HTTPMethods.content, forHTTPHeaderField: HTTPHeader.contentType)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = (response as? HTTPURLResponse),
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        
        guard let modelResponse = try? JSONDecoder().decode(HerosEntry.self, from: data) else {
            throw NetworkError.dataDecodingFailed
        }
        
        for hero in modelResponse.data.results {
            heros.append(hero)
        }
        
        return (modelResponse, heros)
    }
}


//MARK: - NetworkHerosFake
public final class NetworkHerosFake: NetworkHerosProtocol {
    
    // MARK: Init
    public init() {}
    
    //MARK: GetHerosFake
    public func getHeros() async throws -> (HerosEntry, [Hero]) {
        return (herosEntryFake, listHeroFake)
    }
}
