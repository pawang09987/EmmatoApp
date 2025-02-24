//
//  LeftMenuIcon.swift
//  EMMOATO
//
//  Created by Pawan Singh on 19/02/25.
//

import SwiftUI

struct LeftMenuIcon: View {
    @State private var isMenuOpen = false
    var body: some View {
        NavigationView {
            ZStack {
                if isMenuOpen {
                    SideMenu()
                        .transition(.move(edge: .leading))
                        .zIndex(1)
                   
                }
            }
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    self.isMenuOpen.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding()
            })
        }
    }
}


struct SideMenu: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    var body: some View {
        
        VStack {

            
            HStack{
                VStack (alignment:.leading) {
                    
                    HStack{
                        Image(systemName: "house.fill")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                        AppButton(action: viewModel.login , title: "DashBoard", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)

                    }
                    
                    HStack{
                        Image(systemName: "calendar")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                        AppButton(action: viewModel.login , title: "TimeSheet", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)
                    }
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                        AppButton(action: viewModel.login , title: "Viewlift", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)
                      
                    }
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                        AppButton(action: viewModel.login , title: "Leaves", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)
                      
                    }
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                        AppButton(action: viewModel.login , title: "EMS", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)
                      
                    }
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                        AppButton(action: viewModel.login , title: "Project", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)
                      
                    }
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                        AppButton(action: viewModel.login , title: "Client", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)
                      
                    }
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                        AppButton(action: viewModel.login , title: "Holiday", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)
                      
                    }
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                        AppButton(action: viewModel.login , title: "Master", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)
                      
                    }
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                        AppButton(action: viewModel.login , title: "Setting", color: Color.clear, textColor: Color.black, fontSize: .systemFont(ofSize: 18 , weight: .bold))
                            .frame(width: 120)
                      
                    }
                
                    
                    
                }
                
                Spacer()
                    
            }
            
            Spacer()
            .frame(maxWidth: .infinity, alignment: .leading)
                
                
           
        }
        .frame(maxWidth: 270, maxHeight: 620, alignment: .leading)
        .background(.gray)
       
    }
 
    }


struct LeftMenuIcon_Previews: PreviewProvider {
    static var previews: some View {
        DrawerContainerView {
            DashboardCollectionView()
        } sidemenu: {
            SideMenu()
        }

//        LeftMenuIcon()
    }
}

