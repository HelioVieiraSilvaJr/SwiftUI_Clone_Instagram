//
//  CommentsCell.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    @ObservedObject var viewModel: CommentCellViewModel
    
    var body: some View {
        HStack {
            if let user = viewModel.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string: viewModel.comment.profileImageUrl))
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFit()
                        .clipShape(Circle())
                    
                    Text(viewModel.comment.username)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                    + Text(" \(viewModel.comment.comment)")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
            
            Text(viewModel.comment.timestamp.timeAgo)
        }
        .padding(.horizontal)
    }
}
