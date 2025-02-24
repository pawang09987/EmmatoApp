//
//  ErrorCases.swift
//  EMMOATO
//
//  Created by Pawan Singh on 20/02/25.
//

import Foundation

enum ErrorCases:LocalizedError{
    case invalidURL
    case invalidResponse
    case invalidData
    var errorDescreption:String? {
        switch self{
        case .invalidURL:
            return "Invalid URL Found"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidData:
            return "Invalid Data"
        }
    }
}
