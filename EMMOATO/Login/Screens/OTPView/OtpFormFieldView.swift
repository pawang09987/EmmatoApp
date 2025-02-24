//
//  OtpFormFieldView.swift
//  EMMOATO
//
//  Created by Pawan Singh on 18/02/25.
//

import SwiftUI
import Combine

struct OtpFormFieldView: View {
  
    @FocusState private var pinFocusState : FocusPin?
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    @State var pinFive: String = ""
    @State var pinSix: String = ""
    var borderColor: Color
    @State var showLoginOTPView: Bool = false
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    


    //MARK -> BODY
    var body: some View {
        NavigationStack {
            ZStack{
                Color.init(uiColor: .init(hex: "#263645") ?? .white)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Verify your Email Address")
                        .foregroundStyle(.white)
                        .font(.system(size: 30))
                        .font(.title2)
                        .fontWeight(.bold)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
                    
                    Text("We have sent Multi-Factor Authentication (MFA) code to your email Please Check Your Email")
                        .foregroundStyle(.white)
                        .font(.body)
                        .fontWeight(.light)
                        .padding(.top)
                    
                    HStack(spacing:15, content: {
                        
                        TextField("", text: $pinOne)
                            .modifier(OtpModifer(pin:$pinOne))
                            .onChange(of:pinOne){newVal in
                                if (newVal.count == 1) {
                                    pinFocusState = .pinTwo
                                }
                            }
                            .focused($pinFocusState, equals: .pinOne)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(borderColor, lineWidth: 0) // Border color and width
                            )
                        
                        
                        TextField("", text:  $pinTwo)
                            .modifier(OtpModifer(pin:$pinTwo))
                            .onChange(of:pinTwo){newVal in
                                if (newVal.count == 1) {
                                    pinFocusState = .pinThree
                                }
                            }
                            .focused($pinFocusState, equals: .pinTwo)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(borderColor, lineWidth: 0)
                            )
                        
                        
                        TextField("",text:$pinThree)
                            .modifier(OtpModifer(pin:$pinThree))
                            .onChange(of:pinThree){newVal in
                                if (newVal.count == 1) {
                                    pinFocusState = .pinFour
                                }
                            }
                            .focused($pinFocusState, equals: .pinThree)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(borderColor, lineWidth: 0)
                            )
                        
                        
                        TextField("", text:$pinFour)
                            .modifier(OtpModifer(pin:$pinFour))
                            .focused($pinFocusState, equals: .pinFour)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(borderColor, lineWidth: 0)
                            )
                        TextField("", text:$pinFive)
                            .modifier(OtpModifer(pin:$pinFour))
                            .focused($pinFocusState, equals: .pinFour)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(borderColor, lineWidth: 0)
                            )
                        TextField("", text:$pinSix)
                            .modifier(OtpModifer(pin:$pinFour))
                            .focused($pinFocusState, equals: .pinFour)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(borderColor, lineWidth: 0)
                            )
                        
                        
                    })
                    .padding(.vertical)
                    VStack(spacing: 15) {
                        AppButton(action: 
                                    {showLoginOTPView = true}, title: "Verify", color: (Color.blue.opacity(0.8)), textColor: Color.white,  fontSize: .systemFont(ofSize: 15, weight: .regular))
                        AppButton(action: viewModel.login, title: "Resend MFA Code", color: (Color.yellow.opacity(0.8)), textColor: Color.white, fontSize: .systemFont(ofSize: 15, weight: .regular))
                        AppButton(action: viewModel.login, title: "Back To Login", color: (Color.red.opacity(0.9)), textColor: Color.white, fontSize: .systemFont(ofSize: 15, weight: .regular))
                        
                    }
                }
                .padding(.horizontal)
            }
            .navigationDestination(isPresented: $showLoginOTPView) {
            
                DrawerContainerView {
                    DashboardCollectionView()
                } sidemenu: {
                    SideMenu()
                }

//                DashboardCollectionView()
        }
        }
           
       
           
       

    }
}
enum FocusPin {
    case  pinOne, pinTwo, pinThree, pinFour
}

struct OtpFormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        OtpFormFieldView(borderColor: .blue)
    }
}
