//
//  UploadPostViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 21/09/22.
//

import Foundation
import UIKit
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func createNewPost(caption: String, image: UIImage, completion: @escaping () -> Void) {
        guard let currentUser = SessionManager.shared.currentUser else { return }
        
        UploadImage.send(image, type: .post) { imageURL in
            let data: [String:Any] = [
                                        "caption": caption,
                                        "timestamp": Timestamp(date: Date()),
                                        "likes": 0,
                                        "imageUrl": imageURL,
                                        "ownerUid": currentUser.uid,
                                        "OwnerImageUrl": currentUser.profileImageURL,
                                        "ownerUsername": currentUser.username
                                    ]
            
            Firestore.firestore().collection(COLLECTION_POSTS).addDocument(data: data) { _ in
                completion()
            }
        }
    }
}
