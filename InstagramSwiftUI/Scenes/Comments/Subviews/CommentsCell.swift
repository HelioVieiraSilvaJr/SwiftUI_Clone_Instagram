//
//  CommentsCell.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    let comment: CommentModel
    
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .frame(width: 40, height: 40)
                .scaledToFit()
                .clipShape(Circle())
            
            Text(comment.username).font(.system(size: 14, weight: .semibold))
            + Text(" \(comment.comment)").font(.system(size: 14))
            
            Spacer()
            
            Text("2d")
        }
        .padding(.horizontal)
    }
}
