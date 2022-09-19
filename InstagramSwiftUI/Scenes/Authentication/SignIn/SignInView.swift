//
//  SignInView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 18/09/22.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    var viewModel: SignInViewModel
    
    init() {
        viewModel = SignInViewModel()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Text("Instagram")
                            .font(.custom("Baskerville", size: 60, relativeTo: .title))
                        .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email,
                                        placeholder: "E-mail",
                                        imageName: "envelope",
                                        keyboardType: .emailAddress)
                        
                        CustomSecureField(text: $password,
                                          placeholder: "Senha")
                    }
                    .padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()

                        Button {

                        } label: {
                            Text("Esqueceu a senha?")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 32)
                        }
                    }

                    Button {
                        viewModel.signin(withEmail: email.lowercased(),
                                         password: password)
                    } label: {
                        Text("Entrar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color.pink)
                            .clipShape(Capsule())
                            .padding(.top)
                            .padding(.horizontal, 32)
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        SignUpView().navigationBarHidden(true)
                    } label: {
                        HStack {
                            Text("Ainda não tem uma conta?")
                                .font(.system(size: 14))
                            
                            Text("Criar")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                    }
                    .padding(.bottom, 16 )
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
