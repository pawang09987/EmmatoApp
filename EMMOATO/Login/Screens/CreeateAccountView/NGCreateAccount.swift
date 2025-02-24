//
//  NGCreateAccount.swift
//  EMMOATO
//
//  Created by Pawan Singh on 20/02/25.
//

import SwiftUI

struct NGCreateAccount: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @State var showLoginOTPView: Bool = false
    @State private var navigateToOtpFormFieldView = false
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground(hex: "#263645")
                VStack (alignment: .leading, spacing:15) {
                    Spacer()
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
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Recovery Your Account")
                            .font(.system(size: 30)).fontWeight(.semibold)
                        Text("Simply Provide Your email and will send you instruction to create a new one")
                            .font(.system(size: 15)).fontWeight(.regular)
                    }.foregroundStyle(.white)
                    
                    AppTextField("Enter Your Email".localized,
                                 image: Image(systemName: "envelope.fill"),
                                 text: $viewModel.username)
                
                    AppButton(action: {
                        showLoginOTPView = true
                    }, title: "Request Sent Link", color: (Color.blue.opacity(0.7)), textColor: Color.white, fontSize: .systemFont(ofSize: 18, weight: .regular))
                    
                    AppButton(action: {
                    }, title: "Back To Login", color: (Color.red.opacity(0.7)), textColor: Color.white, fontSize: .systemFont(ofSize: 18, weight: .regular))
                    
                Spacer()
                }
                .padding(.horizontal)
            }
            .navigationDestination(isPresented: $showLoginOTPView) {
                OtpFormFieldView( borderColor: .blue)
            }
            
        }
    }
    }

#Preview {
    NGCreateAccount()
}
