//
//  CustomInputText.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import SwiftUI

struct CustomInputText: View {
    @Binding var inputText: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack {
                TextField("Comentário...", text: $inputText)
                    .disableAutocorrection(true)
                
                Button(action: action) {
                    Text("Enviar")
                        .bold()
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.bottom, 8)
        .padding(.horizontal)
    }
}

struct CustomInputText_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputText(inputText: .constant("")) {
            
        }
    }
}
