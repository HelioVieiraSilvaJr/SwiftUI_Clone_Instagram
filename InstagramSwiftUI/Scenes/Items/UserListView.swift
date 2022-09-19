//
//  UserListView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 15/09/22.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(0 ..< 20) { _ in
                    NavigationLink(destination: ProfileView()) {
                        UserCell()
                            .padding(.leading)
                    }
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
