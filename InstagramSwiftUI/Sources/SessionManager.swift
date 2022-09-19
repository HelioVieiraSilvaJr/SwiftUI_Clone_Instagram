//
//  SessionManager.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 19/09/22.
//

import Foundation
import Firebase

class SessionManager: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    static var shared: SessionManager = SessionManager()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func logout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
