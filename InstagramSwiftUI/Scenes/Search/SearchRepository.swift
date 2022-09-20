//
//  SearchRepository.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 19/09/22.
//

import SwiftUI
import Firebase

class SearchRepository {
    
    func fetchUsers(didSuccess: @escaping (([UserModel]) -> Void)) {
        guard let _ = SessionManager.shared.uid else { return }
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            if let error = error {
                print("ERROR: Não foi possivel pegar coleção 'users' -> (\(error.localizedDescription).")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            let users = documents.compactMap({ JSONDecoder.decode(to: UserModel.self, from: $0.data()) })
            didSuccess(users)
        }
    }
}
