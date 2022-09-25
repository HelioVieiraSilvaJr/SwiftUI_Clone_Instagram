//
//  EditProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 25/09/22.
//

import Firebase
import SwiftUI

final class EditProfileViewModel: ObservableObject {
    
    @Published var user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
    
    func save(bio: String, completion: @escaping () -> Void) {
        guard let currenteUser = SessionManager.shared.currentUser else { return }
        Firestore.firestore().collection(COLLECTION_USERS)
            .document(currenteUser.uid)
            .updateData(["bio": bio]) { _ in
                
            completion()
        }
    }
}
