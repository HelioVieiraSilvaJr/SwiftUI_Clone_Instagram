//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 16/09/22.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = false
    
    var body: some View {
        HStack {
            Image("coringa")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("coringa")
                .font(.system(size: 14, weight: .semibold)) +
            Text(" Liked one your posts.")
                .font(.system(size: 14))
            
            Spacer()
            
            if showPostImage {
                Image("coringa")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            }
            else {
                Button {
                    
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
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
