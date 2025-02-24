//
//  NetworkManager.swift
//  EMMOATO
//
//  Created by Pawan Singh on 19/02/25.
//

import Foundation

final class WebService{
    static func getUserDetail() async throws -> [LoginRequest] {
        let urlSring = "PPPPPPPPP"
        guard let url = URL(string: urlSring) else{
            throw ErrorCases.invalidResponse
        }
        let (data , response) = try await URLSession.shared.data(from: url)
        
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else{
            throw ErrorCases.invalidResponse
        }
        do{
         let decoder = JSONDecoder()
            return try decoder.decode([LoginRequest].self, from: data)
        }
        catch{
            throw ErrorCases.invalidData
            
        }
        
        
    }
}


