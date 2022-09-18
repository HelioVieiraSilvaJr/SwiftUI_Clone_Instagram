//
//  SignInView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 18/09/22.
//

import SwiftUI

struct SignInView: View {
    @State var textFieldEmail = ""
    @State var textFieldPassword = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        
                        Text("Instagram")
                            .font(.custom("Baskerville", size: 60, relativeTo: .title))
                        .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $textFieldEmail,
                                            placeholder: "E-mail",
                                            imageName: "envelope",
                                        keyboardType: .emailAddress)
                        
                        CustomSecureField(text: $textFieldPassword, placeholder: "Senha")
                    }
                    .padding(.horizontal, 25)
                    
                    //Forgot
                    
                    //SignIn buton
                    
                    //SignUp goto
                    
                    Spacer()
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
