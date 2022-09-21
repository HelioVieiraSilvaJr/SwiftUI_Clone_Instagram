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
                    UserStatView(value: 10, title: "Postagens")
                    UserStatView(value: 30, title: "Seguidores")
                    UserStatView(value: 22, title: "Seguindo")
                }
                .padding(.trailing, 32)
            }
            
            Text(viewModel.user.username)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gotham's Dark Knight || Billionaire")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            }
            .padding(.top)

        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(viewModel: ProfileViewModel(user: UserModel(email: "",
                                                                      username: "",
                                                                      fullname: "",
                                                                      profileImageURL: "",
                                                                      uid: "")))
    }
}
