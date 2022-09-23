//
//  CommentsViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import Foundation

class CommentsViewModel: ObservableObject {
    @Published var comments: [CommentModel] = []
    private let post: PostModel
    private let repository = CommentsRepository()
    
    init(post: PostModel) {
        self.post = post
        fetchComments()
    }
    
    func send(comment: String) {
        repository.send(comment: comment, fromPost: post) {
            self.fetchComments()
            NotificationsManager.shared.sendNotification(toUid: self.post.ownerUid,
                                                         type: .comment,
                                                         post: self.post)
        }
    }
    
    func fetchComments() {
        repository.fetchComments(post: post) { comments in
            self.comments = comments
        }
    }
}
