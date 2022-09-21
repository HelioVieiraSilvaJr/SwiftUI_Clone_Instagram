//
//  FeedViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 21/09/22.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        Firestore.firestore().collection(COLLECTION_POSTS).getDocuments { snapshot, error in
            if let error = error {
                print("ERROR: Não foi possivel recuperar os Posts do usuário. (\(error.localizedDescription)")
                return
            }
            
            if let documents = snapshot?.documents {
                self.posts = documents.compactMap({ JSONDecoder.decode(to: PostModel.self, from: $0.data()) })
            }
        }
    }
}
