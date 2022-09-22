//
//  CommentsRepository.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import Foundation
import Firebase

struct CommentsRepository {
    
    func send(comment: String, fromPost post: PostModel , completion: @escaping () -> Void) {
        guard let currentUser = SessionManager.shared.currentUser,
              let postId = post.id else { return }
        
        let data = CommentModel(username: currentUser.username,
                                profileImageUrl: currentUser.profileImageURL,
                                uid: currentUser.uid,
                                timestamp: Date(),
                                postOwnerUid: post.ownerUid,
                                comment: comment)
        
        Firestore.firestore().collection(COLLECTION_POSTS).document(postId).collection(COLLECTION_POST_COMMENTS).addDocument(data: data.toJSON()) { _ in
            completion()
        }
    }
    
    func fetchComments(post: PostModel, completion: @escaping ([CommentModel]) -> Void) {
        guard let postId = post.id else { return }
        Firestore.firestore().collection(COLLECTION_POSTS).document(postId).collection(COLLECTION_POST_COMMENTS)
            .getDocuments { snapshot, _ in
            
                guard let documents = snapshot?.documents else { return }
                let comments: [CommentModel] = documents.compactMap({ JSONDecoder.decode(to: CommentModel.self, from: $0.data()) })
                completion(comments)
        }
    }
}
