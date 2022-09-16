//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 15/09/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("superman")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                
            VStack(alignment: .leading) {
                Text("superman")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Clark Kent")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
