//
//  FeedCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 21/09/22.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    
    @Published var post: PostModel
    var isLiked: Bool { post.isLiked ?? false }
    private let repository = FeedRepository()
    
    init(post: PostModel) {
        self.post = post
        fetchListLikes()
    }
    
    func toggleLike() {
        if isLiked {
            repository.unLike(post: post) {
                self.fetchListLikes()
            }
        }
        else {
            repository.like(post: post) {
                self.fetchListLikes()
            }
        }
    }
    
    func fetchListLikes() {
        repository.fetchListLikes(post: post) { listLikes in
            self.post.listLikes = listLikes
            self.checkIfPostIsLiked()
        }
    }
    
    private func checkIfPostIsLiked() {
        guard let currentUid = SessionManager.shared.uid else { return }
        post.isLiked = post.listLikes?.contains(currentUid) ?? false
    }
    
    func getLikesDescription() -> String {
        let likes = post.listLikes?.count ?? 0
        let likesName = likes == 1 ? "like" : "likes"
        return "\(likes) \(likesName)"
    }
    
    func imageNameFromLikedButton() -> String {
        post.isLiked ?? false ? "heart.fill" : "heart"
    }
}
