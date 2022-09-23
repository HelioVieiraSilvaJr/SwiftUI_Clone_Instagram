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
    @Published private(set) var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel? {
        didSet {
            StorageModels.set(currentUser, key: "currentUser")
        }
    }
    var uid: String? {
        Auth.auth().currentUser?.uid
    }
    
    // MARK: Inicialization
    init() {
        userSession = Auth.auth().currentUser
        
        if let currentUser = StorageModels.get(type: UserModel.self, key: "currentUser") {
            self.currentUser = currentUser
        }
    }
    
    // MARK: Methods
    func startSession(userSession: FirebaseAuth.User) {
        self.userSession = userSession
        fetchUser()
        NotificationsManager.shared.fetchNotifications()
    }
    
    func logout() {
        self.userSession = nil
        self.currentUser = nil
        try? Auth.auth().signOut()
        NotificationsManager.shared.clear()
    }
    
    // MARK: Private Methods
    private func fetchUser() {
        guard let uid = SessionManager.shared.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                debugPrint("ERROR: Não foi possivel recuperar Usuário. (\(error.localizedDescription)")
                return
            }
            
            guard let dict = snapshot?.data() else { return }
            let user = JSONDecoder.decode(to: UserModel.self, from: dict)
            self.currentUser = user
        }
    }
}
