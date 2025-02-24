//
//  LoginViewModels.swift
//  EMMOATO
//
//  Created by Pawan Singh on 17/02/25.
//

import Foundation
class LoginViewModel: ObservableObject {
    
    @Published var welcome: String = ""
    @Published var welcomDescreption: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var error: String?
    @Published var isLoginSuccessful: Bool = false
    

    func login() {
        LoginAction(
            parameters: LoginRequest(
                welcome: welcome,
                welcomDescreption: welcomDescreption,
                username: username,
                password: password
            )
        ).call { response in
            if response.data.isSuccess{
                DispatchQueue.main.async {
                    self.isLoginSuccessful = true
                }
            }else{
                
            }
           
        }
    }
}
