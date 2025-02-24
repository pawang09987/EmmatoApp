//
//  LoginRequest.swift
//  EMMOATO
//
//  Created by Pawan Singh on 17/02/25.
//

import SwiftUI
struct LoginRequest: Decodable , Encodable {
    let welcome:String
    let welcomDescreption:String
    let username: String
    let password: String
    
}
