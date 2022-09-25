//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 25/09/22.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var viewModel: EditProfileViewModel
    @State var textBio = ""
    @Environment(\.presentationMode) var mode
    var didCompletion: () -> Void
    
    init(user: UserModel, completion: @escaping () -> Void) {
        self.viewModel = EditProfileViewModel(user: user)
        _textBio = State(initialValue: user.bio ?? "")
        didCompletion = completion
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancelar")
                }
                
                Spacer()
                
                Button {
                    viewModel.save(bio: textBio) {
                        self.didCompletion()
                        mode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Salvar")
                }
            }
            .padding()
            
            CustomTextView(text: $textBio, placeholder: "Escreva sua bio....")
            
            Spacer()
        }
    }
}
