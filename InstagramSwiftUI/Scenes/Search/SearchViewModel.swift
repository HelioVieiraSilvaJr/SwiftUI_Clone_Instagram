//
//  SearchViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 19/09/22.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var users = [UserModel]()
    @Published var posts = [PostModel]()
    var repository: SearchRepository = SearchRepository()
    
    init() {
        fetchUsers()
        fetchPosts()
    }
    
    func fetchUsers() {
        repository.fetchUsers { users in
            self.users = users
        }
    }
    
    func filteringUsers(text: String) -> [UserModel] {
        users.filter({ $0.username.lowercased().contains(text.lowercased())
            || $0.fullname.lowercased().contains(text.lowercased()) })
    }
    
    func fetchPosts() {
        repository.fetchPosts { posts in
            self.posts = posts
        }
    }
}
