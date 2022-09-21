//
//  ContentView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 14/09/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @State var selectionIndex = 0
    
    var body: some View {
        Group {
            if sessionManager.userSession == nil {
                SignInView()
            }
            else {
                MainTabView(selectedIndex: $selectionIndex)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
