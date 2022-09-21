//
//  ProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 20/09/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: UserModel
    private let repository: ProfileRepository
   
    init(user: UserModel) {
        self.user = user
        self.repository = ProfileRepository()
        checkIfUserIsFollowed()
    }
    
    func setFollow() {
        repository.follow(uid: user.uid) { _ in
            self.user.isFollowed = true
        }
    }
    
    func setUnfollow() {
        repository.unFollow(uid: user.uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser() else { return }
        repository.isFollowed(uid: user.uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}