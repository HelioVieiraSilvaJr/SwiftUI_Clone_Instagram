//
//  ContentView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 14/09/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        Group {
            if sessionManager.userSession == nil {
                SignInView()
            }
            else {
                MainTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
