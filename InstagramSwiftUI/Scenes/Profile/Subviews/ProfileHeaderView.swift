//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 16/09/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Postagens")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Seguidores")
                    UserStatView(value: viewModel.user.stats?.followings ?? 0, title: "Seguindo")
                }
                .padding(.trailing, 32)
            }
            
            Text(viewModel.user.username)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text((viewModel.user.bio ?? ""))
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView(viewModel: viewModel) {
                    viewModel.updateUser()
                }
                
                Spacer()
            }
            .padding(.top)

        }
    }
}
