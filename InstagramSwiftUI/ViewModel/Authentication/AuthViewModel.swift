//
//  AuthViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 18/09/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    static var shared: AuthViewModel = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func signin(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Usuário logado com sucesso!")
        }
    }
    
    func signup(withEmail email: String,
                password: String,
                image: UIImage,
                username: String,
                fullname: String) {
        UploadImage.image(image) { imageURL in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let user = result?.user else { return }
                print("Usuário criado com sucesso!")
                
                let data = [
                    "email": email,
                    "username": username,
                    "fullname": fullname,
                    "profileImageURL": imageURL,
                    "uid": user.uid
                ]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    print("Os dados do usuário foram salvos com sucesso!")
                    self.userSession = user
                }
            }
        }
    }
    
    func logout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
    }
    
    func fetchUser() {
        
    }
}
