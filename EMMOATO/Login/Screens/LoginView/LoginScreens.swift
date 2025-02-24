//
//  LoginScreens.swift
//  EMMOATO
//
//  Created by Pawan Singh on 17/02/25.
//

import SwiftUI
struct LoginScreen: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @State var showLoginOTPView: Bool = false
    @State var showCreateAccountView: Bool = false
    @State private var navigateToOtpFormFieldView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground(hex: "#263645")
                contentView
            } 
            .navigationDestination(isPresented: $showLoginOTPView) {
                OtpFormFieldView( borderColor: .blue)
            }
            .navigationDestination(isPresented: $showCreateAccountView) {
                NGCreateAccount()
            }
        }
    }
    
    var contentView: some View {
        VStack (alignment: .leading, spacing:15) {
            Spacer()
            logoView
            
            VStack(alignment: .leading, spacing: 25) {
                Text("Welcome Back!")
                    .font(.title)
                Text("We are really happy to see you again!")
                    .font(.subheadline)
            }.foregroundStyle(.white)
            
            AppTextField("Enter Your Email".localized,
                         image: Image(systemName: "envelope.fill"),
                         text: $viewModel.username)
            
            AppSecureField("Enter Your Password".localized,
                           image: Image(systemName: "lock.fill"),
                           text: $viewModel.password)
            
            HStack {
                Spacer()
                Button(action: { showCreateAccountView = true}) {
                    Text("Trouble to Login")
                        .foregroundColor(.blue)
                }
            }
            
            AppButton(action: {
                showLoginOTPView = true
            }, title: "Login", color: (Color.blue.opacity(0.7)), textColor: Color.white, fontSize: .systemFont(ofSize: 18, weight: .bold))
            
            HStack(spacing: 5){
                Rectangle()
                    .frame(height: 1)
                Text("OR")
                Rectangle()
                    .frame(height: 1)
            }.foregroundColor(.white)
            HStack {
                AppButton(action: viewModel.login, title: "Google", color: Color.white, textColor: Color.black, fontSize: .systemFont(ofSize: 14, weight: .semibold))
                AppButton(action: viewModel.login, title: "Microsoft", color: Color.white, textColor: Color.black, fontSize: .systemFont(ofSize: 14, weight: .semibold))
            }
            Spacer()
        }
        .padding(.top, -50)
        .padding(.horizontal)
    }
    
    var logoView: some View {
        HStack(spacing:30) {
            Image(systemName: "person.fill")
                .resizable()
                .foregroundColor(.white)
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text("Emmato")
                .fontWeight(.bold)
                .font(.system(size: 40))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top, 40)
    }
}
    

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

import UIKit
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        let start = hex.hasPrefix("#") ? hex.index(hex.startIndex, offsetBy: 1) : hex.startIndex
        var hexColor = String(hex[start...])
        hexColor += "ff"
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255

                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }

        return nil
    }
}
