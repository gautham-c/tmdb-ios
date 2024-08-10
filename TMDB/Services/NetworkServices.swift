//
//  NetworkServices.swift
//  TMDB
//
//  Created by Gautham C on 7/16/24.
//

import Foundation

class NetworkServices {
    
    func fetchData<T: Decodable>(as type: T.Type, for url: String) async throws -> T {
        guard let url = URL(string: "\(Constants.apiUrl)\(url)?api_key=\(Constants.apiKey)") else {
            throw URLError(.badURL)
        }

        let (data,_) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let output = try decoder.decode(T.self, from: data)
        return output
    }
    
    func fetchData<T: Decodable>(as type: T.Type, for url: String, with params: String) async throws -> T {
        guard let url = URL(string: "\(Constants.apiUrl)\(url)?api_key=\(Constants.apiKey)\(params)") else {
            throw URLError(.badURL)
        }

        let (data,_) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let output = try decoder.decode(T.self, from: data)
        return output
    }
    
}

