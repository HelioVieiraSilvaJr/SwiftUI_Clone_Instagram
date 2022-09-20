//
//  SignUpViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 19/09/22.
//

import UIKit
import Firebase

class SignUpViewModel {
    
    func signup(withEmail email: String,
                password: String,
                image: UIImage,
                username: String,
                fullname: String) {
        UploadImage.profile(image) { imageURL in
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
                    SessionManager.shared.startSession(userSession: user)
                }
            }
        }
    }
}
