//
//  MainTabView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 14/09/22.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var sessionManager = SessionManager.shared
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(1)
                
                UploadPostView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                    .tag(2)
                
                NotificationsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }
                    .tag(3)
                
                if let user = sessionManager.currentUser {
                    ProfileView(user: user)
                        .onTapGesture {
                            selectedIndex = 4
                        }
                        .tabItem {
                            Image(systemName: "person")
                        }
                        .tag(4)
                }
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: selectedIndex == 4 ? buttonLogout : nil)
            .accentColor(.black)
        }
    }
    
    var buttonLogout: some View {
        Button {
            SessionManager.shared.logout()
        } label: {
            Text("Sair").foregroundColor(.black)
        }
    }
    
    var navigationTitle: String {
        switch selectedIndex {
        case 0: return "Feed"
        case 1: return "Buscar"
        case 2: return "Fazer nova publicação"
        case 3: return "Notificações"
        case 4: return "Perfil"
        default: return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(selectedIndex: .constant(0))
    }
}
