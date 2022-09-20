//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 15/09/22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: UserModel
    
    var body: some View {
        HStack {
            
            KFImage(URL(string: user.profileImageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: UserModel(email: "",
                                 username: "helinho",
                                 fullname: "Helio Vieira Jr",
                                 profileImageURL: "",
                                 uid: ""))
    }
}
