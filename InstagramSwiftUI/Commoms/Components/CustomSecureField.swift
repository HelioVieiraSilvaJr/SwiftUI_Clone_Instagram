//
//  CustomSecureField.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 18/09/22.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        ZStack {
            if text.isEmpty {
                HStack {
                    Text(placeholder)
                        .foregroundColor(Color.init(white: 1, opacity: 0.8))
                        .padding(.leading, 40)
                    
                    Spacer()
                }
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
                    .foregroundColor(.white)
                    .accentColor(.white)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .background(Color.init(white: 1, opacity: 0.15))
            .cornerRadius(10)
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(text: .constant(""), placeholder: "Password")
    }
}
