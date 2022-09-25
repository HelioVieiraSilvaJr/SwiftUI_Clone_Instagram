//
//  ProfileActionButtonView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 16/09/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { viewModel.user.isFollowed ?? false }
    @State private var showEditProfile = false
    var didUpdateView: () -> Void
    
    var body: some View {
        if viewModel.user.isCurrentUser() {
            Button {
                showEditProfile.toggle()
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
            .sheet(isPresented: $showEditProfile) {
                print("==> Fechou Sheet EditProfile.")
            } content: {
                EditProfileView(user: viewModel.user) {
                    self.didUpdateView()
                }
            }
            .onAppear {
                print("==> Apareceu denovo!! ProfileActionBottonView")
            }

        }
        else {
            HStack {
                Button {
                    isFollowed
                        ? viewModel.setUnfollow()
                        : viewModel.setFollow()
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
