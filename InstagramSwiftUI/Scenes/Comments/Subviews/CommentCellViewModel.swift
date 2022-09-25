//
//  CommentCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 23/09/22.
//

import Foundation

class CommentCellViewModel: ObservableObject {
    
    let comment: CommentModel
    private let repository = CommentsRepository()
    @Published var user: UserModel?
    
    init(comment: CommentModel) {
        self.comment = comment
        getNotificationUser()
    }
    
    private func getNotificationUser() {
        repository.getNotificationUser(uid: comment.postOwnerUid) { user in
            self.user = user
        }
    }
}
