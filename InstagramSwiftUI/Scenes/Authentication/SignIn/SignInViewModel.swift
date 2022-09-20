//
//  SignInViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 19/09/22.
//

import Foundation
import Firebase

class SignInViewModel {
    
    func signin(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            SessionManager.shared.startSession(userSession: user)
            print("Usuário logado com sucesso!")
        }
    }
    
    func resetPassword() {
    }
}
