//
//  File.swift
//  
//
//  Created by Jose Bueno Cruz on 9/6/24.
//

import Foundation

// MARK: - Protocol
public protocol NetworkSeriesProtocol {
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie])
}

// MARK: - NetworkSeries
public final class NetworkSeries: NetworkSeriesProtocol {
    
    // MARK: Init
    public init() {}
    
    // MARK: GetSeries
    public func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie]) {
        
        var series: [Serie] = []
        
        guard let url = URL(string: "\(ConstApp.API_URL)\(stringEndpoint(id: hero.id, endpoint: .series))?\(ConstApp.TS)&\(ConstApp.PUBLIC_KEY)&\(ConstApp.HASH_MD5)") else {
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
        
        guard let modelResponse = try? JSONDecoder().decode(SeriesEntry.self, from: data) else {
            throw NetworkError.dataDecodingFailed
        }
        
        for serie in modelResponse.data.results {
            series.append(serie)
        }
        
        return (modelResponse, series)
    }
}
