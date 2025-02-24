//
//  ProfileandLogoutScreen.swift
//  EMMOATO
//
//  Created by Pawan Singh on 21/02/25.
//

import SwiftUI



struct ProfileandLogoutScreen: View {
    @State private var isMenuVisible = false  // State to toggle th
    @Binding var showView: Bool

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if showView {
                    VStack(alignment: .leading, spacing: 20) {
                        Button(action: {
                            
                            print("Profile tapped")
                        }) {
                            Text("Profile")
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.blue)
                        }
                        
                        Button(action: {
                            
                            print("Preferences tapped")
                        }) {
                            Text("Preferences")
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.blue)
                        }
                        
                        Button(action: {
                            
                            print("Trusted Device tapped")
                        }) {
                            Text("Trusted Device")
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.blue)
                        }
                        
                        Button(action: {
                            
                            print("Change Password tapped")
                        }) {
                            Text("Change Password")
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.blue)
                        }
                        
                        Button(action: {
                            // Action for Logout
                            print("Logout tapped")
                        }) {
                            Text("Logout")
                                .padding()
                                .background(Color.red.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .transition(.move(edge: .trailing))
                    .padding(.top, -120)
                    Spacer()
//
                    
                }
                    
            }
//            .navigationBarItems(trailing: Button(action: {
//                withAnimation {
//                    isMenuVisible.toggle()
//                    print("inside menu button")
//                }
//            }) {
//            
//                Image(systemName: "ellipsis.circle.fill")
//                    .resizable()
//                    .frame(width: 30, height: 30)
//                    .foregroundColor(.blue)
//            })
            
        }
        
    }
}

struct ProfileandLogoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileandLogoutScreen(showView: .constant(false))
    }
}


