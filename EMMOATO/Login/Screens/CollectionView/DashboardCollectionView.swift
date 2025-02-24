//
//  DashboardCollectionView.swift
//  EMMOATO
//
//  Created by Pawan Singh on 19/02/25.
//

import SwiftUI


struct DrawerActionPreferenceKey: PreferenceKey {
    typealias Value = Bool
    static var defaultValue = false
    static func reduce(value: inout Value, nextValue: () -> Value) {
        
    }
}

extension View {
    func showMenu(_ value: Bool) -> some View {
        self.preference(key: DrawerActionPreferenceKey.self, value: value)
    }
}
struct DrawerContainerView<ContentView: View, SideMenuView: View>: View {
    @State var showMenu: Bool = false
    let contentView: ContentView
    let sideMenuView: SideMenuView
    init(@ViewBuilder content: () -> ContentView, @ViewBuilder sidemenu: () -> SideMenuView) {
        self.contentView = content()
        self.sideMenuView = sidemenu()
    }
    var body: some View {
        ZStack {
            contentView
            if showMenu {
                sideMenuView
                    .transition(.move(edge: .leading))
            }
        }
        .onPreferenceChange(DrawerActionPreferenceKey.self) { value in
            withAnimation {
                self.showMenu = value
            }
        }
    }
}

struct SideMenuContainer<Content: View>: View {
    @Binding var isHidden: Bool
    let content: Content
    init(content: Content, isHidden: Binding<Bool>) {
        self.content = content
        self._isHidden = isHidden
    }
    var body: some View {
        VStack {
            if isHidden {
                self.content
            }
        }
    }
}



struct DashboardCollectionView: View {
    @State private var isLeftMenuOpen = false
    @State private var isRightMenuOpen = false
    @State private var hideButton: Bool = false
    let items = ["Pending Leave", "Approval Leave", "Applied Leave"]
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            self.isLeftMenuOpen.toggle()
                            self.isRightMenuOpen = false
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                        
                            .frame(width: 25, height: 25)
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.isRightMenuOpen.toggle()
                            self.isLeftMenuOpen = false
                            
                        }
                    }) {
                        Image(systemName: "ellipsis.circle.fill")
                            .resizable()
                        
                            .frame(width: 30, height: 30)
                            .padding()
                    }
            }
                
//                    if isLeftMenuOpen {
//                        SideMenu(viewModel: viewModel)
//                            .transition(.move(edge: .leading))
//                            .zIndex(3)
//                    }
                    if isRightMenuOpen {
                        ProfileandLogoutScreen(showView: $isRightMenuOpen)
                    }
                
                    ScrollView(.horizontal) {
                        VStack() {
                            HStack(spacing: 10) {
                                ForEach(items, id: \.self) { item in
                                    VStack {
                                        Text("\(item)")
                                            .frame(width: 300, height: 140)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 0)
                                    }
                                }
                                
                            }
                            .padding(.horizontal)
                        }
                    
                }
                Spacer()
            }.showMenu(isLeftMenuOpen)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        DashboardCollectionView()
//        SideMenu()
        DrawerContainerView {
            DashboardCollectionView()
        } sidemenu: {
            SideMenu()
        }

    }
}
