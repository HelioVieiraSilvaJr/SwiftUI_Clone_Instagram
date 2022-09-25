//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 16/09/22.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    
    var body: some View {
        HStack {
            if let user = viewModel.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                    Text(viewModel.notification.username)
                        .font(.system(size: 14, weight: .semibold))
                    + Text(" \(viewModel.notification.type.notificationMessage)")
                            .font(.system(size: 14))
                    + Text(" \(viewModel.notification.timestamp.timeAgo)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
            }
            
            Spacer()
            
            if viewModel.notification.type == .follow {
                if viewModel.isFollowed {
                    Text("Seguindo")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .foregroundColor(.black)
                        .overlay {
                            Capsule()
                                .stroke(Color.black, lineWidth: 1)
                        }
                        .font(.system(size: 14, weight: .semibold))
                } else {
                    Button {
                        print("==> Seguir de volta!")
                    } label: {
                        Text("Seguir")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .font(.system(size: 14, weight: .semibold ))
                    }
                }
            }
            else {
                if let post = viewModel.post {
                    NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))) {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            viewModel.checkIfFollowed()
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell(viewModel: NotificationCellViewModel(notification: NotificationModel(timestamp: Date(),
                                                                                              username: "batman",
                                                                                              uid: "",
                                                                                              profileImageUrl: "",
                                                                                              type: .like,
                                                                                              postId: nil)))
    }
}
