//
//  CustomTextView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 21/09/22.
//

import SwiftUI

struct CustomTextView: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .padding(4)
                .disableAutocorrection(true)
        }
        .font(.body)
    }
}
