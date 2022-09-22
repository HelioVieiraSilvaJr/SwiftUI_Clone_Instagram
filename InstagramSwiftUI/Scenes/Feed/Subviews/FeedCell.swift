//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 15/09/22.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            //User info
            HStack {
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            // post image
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 360)
                .clipped()
            
            // action buttons
            HStack (spacing: 16) {
                Button(action: {
                    viewModel.toggleLike()
                }, label: {
                    Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .foregroundColor(viewModel.isLiked ? .red : .black)
                        .padding(4)
                })
                
                NavigationLink {
                    CommentsView(viewModel: CommentsViewModel(post: viewModel.post))
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }

                
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
            }
            .foregroundColor(.black)
            .padding(.leading, 4)
            
            // caption
            
            Text(viewModel.getLikesDescription())
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold)) + Text(" \(viewModel.post.caption)")
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(viewModel: FeedCellViewModel(post: PostModel(caption: "",
                                                              timestamp: Date(),
                                                              likes: 0,
                                                              imageUrl: "",
                                                              ownerUid: "",
                                                              ownerImageUrl: "",
                                                              ownerUsername: "")))
    }
}
