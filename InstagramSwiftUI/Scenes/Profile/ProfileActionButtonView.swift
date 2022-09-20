//
//  ProfileActionButtonView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 16/09/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    let isCurrentUser: Bool
    let isFollowed: Bool
    
    var body: some View {
        if isCurrentUser {
            Button {
                
            } label: {
                Text("Editar Perfil")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
        }
        else {
            HStack {
                Button {
                    
                } label: {
                    Text(isFollowed ? "Seguindo" : "Seguir")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        }
                }
                .cornerRadius(3)
                
                Button {
                    
                } label: {
                    Text("Mensagem")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        }
                }
            }
        }
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView(isCurrentUser: true, isFollowed: false)
    }
}
