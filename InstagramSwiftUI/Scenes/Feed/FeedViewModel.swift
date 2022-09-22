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
    private let repository = FeedRepository()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        repository.fetchPosts { posts in
            self.posts = posts
        }
    }
}
