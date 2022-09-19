//
//  SignUpView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 18/09/22.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var username = ""
    @State var fullname = ""
    @State var password = ""
    @State private var selectedImage: UIImage?
    @State var image: Image?
    @State var imagePickerPresented = false
    @State private var showingOptions = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    
                    let image = self.image ?? Image("person_placeholder")
                    
                    Button {
                        showingOptions.toggle()
                    } label: {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .clipped()
                    }
                    .confirmationDialog("O que deseja fazer?", isPresented: $showingOptions, titleVisibility: .visible) {
                        
                        Button {
                            imagePickerPresented.toggle()
                        } label: {
                            Text("Galeria")
                        }
                        
                        
                        Button("Tirar foto") {
                            print("Clicou em tirar foto!")
                        }

                    }
                    .sheet(isPresented: $imagePickerPresented) {
                        print("Pegou a imagem!!")
                        guard let selectedImage = selectedImage else { return }
                        self.image = Image(uiImage: selectedImage)
                        print("Sucesso em converter a imagem!!")
                    } content: {
                        ImagePicker(image: $selectedImage)
                    }
                    
                    Spacer()
                }
                .padding()
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email,
                                    placeholder: "E-mail",
                                    imageName: "envelope",
                                    keyboardType: .emailAddress)
                    
                    CustomTextField(text: $username,
                                    placeholder: "Usuário",
                                    imageName: "person",
                                    keyboardType: .default)
                    
                    CustomTextField(text: $fullname,
                                    placeholder: "Nome completo",
                                    imageName: "person",
                                    keyboardType: .default)
                    
                    CustomSecureField(text: $password, placeholder: "Senha")
                }
                .padding(.horizontal, 32)
                
                Button {
                    guard let image = selectedImage else {
                        print("ERROR: Imagem do perfil esta vazia.")
                        return
                    }
                    
                    viewModel.signup(withEmail: email.lowercased(),
                                     password: password,
                                     image: image,
                                     username: username,
                                     fullname: fullname)
                } label: {
                    Text("Criar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.pink)
                        .clipShape(Capsule())
                        .padding(.top)
                        .padding(.horizontal, 32)
                }
                
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Já possui uma conta?")
                            .font(.system(size: 14))
                        
                        Text("Entrar")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .padding(.bottom, 16 )
                
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
