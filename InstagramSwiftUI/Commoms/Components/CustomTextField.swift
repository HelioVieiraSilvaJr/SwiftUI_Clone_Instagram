//
//  CustomTextField.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 18/09/22.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    let imageName: String
    let keyboardType: UIKeyboardType
    
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
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .keyboardType(keyboardType)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .background(Color.init(white: 1, opacity: 0.15))
            .cornerRadius(10)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder: "E-mail", imageName: "envelope", keyboardType: .default)
    }
}
