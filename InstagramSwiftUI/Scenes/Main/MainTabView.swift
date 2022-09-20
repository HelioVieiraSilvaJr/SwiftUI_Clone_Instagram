//
//  MainTabView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 14/09/22.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var sessionManager = SessionManager.shared
    
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                
                if let user = sessionManager.currentUser {
                    ProfileView(user: user)
                        .tabItem {
                            Image(systemName: "person")
                        }
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: buttonLogout)
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
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
