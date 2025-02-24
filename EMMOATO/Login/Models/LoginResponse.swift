//
//  LoginResponse.swift
//  EMMOATO
//
//  Created by Pawan Singh on 17/02/25.
//

import SwiftUI
struct LoginResponse: Decodable {
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
    var isSuccess = true
}
