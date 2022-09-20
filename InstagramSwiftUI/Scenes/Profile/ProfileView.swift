//
//  ProfileView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 14/09/22.
//

import SwiftUI

struct ProfileView: View {
    let user: UserModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(user: user)
                
                PostGridView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: UserModel(email: "",
                                    username: "",
                                    fullname: "",
                                    profileImageURL: "",
                                    uid: ""))
    }
}
