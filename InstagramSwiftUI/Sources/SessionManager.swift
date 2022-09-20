//
//  SessionManager.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 19/09/22.
//

import Foundation
import Firebase

class SessionManager: ObservableObject {
    
    // MARK: Properties
    static var shared: SessionManager = SessionManager()
    @Published var userSession: FirebaseAuth.User?
    
    var uid: String? {
        Auth.auth().currentUser?.uid
    }
    
    // MARK: Inicialization
    init() {
        userSession = Auth.auth().currentUser
    }
    
    // MARK: Methods
    func logout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
