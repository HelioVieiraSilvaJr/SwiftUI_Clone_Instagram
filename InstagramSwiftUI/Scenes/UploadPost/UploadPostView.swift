//
//  UploadPostView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 14/09/22.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .foregroundColor(Color.black)
                        .overlay {
                            Circle()
                                .stroke(Color.black, lineWidth: 1)
                        }
                }
                .padding(.top, 56)
                .sheet(isPresented: $imagePickerPresented) {
                    guard let image = selectedImage else { return }
                    postImage = Image(uiImage: image)
                } content: {
                    ImagePicker(image: $selectedImage)
                }

            }
            else if let postImage = postImage {
                HStack(alignment: .top) {
                    postImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .foregroundColor(Color.black)
                    
                    CustomTextView(text: $captionText,
                                   placeholder: "Escreva seu comentário...")
                        .frame(height: 200)
                }
                .padding()
                
                HStack(spacing: 16) {
                    Button {
                        captionText = ""
                        self.postImage = nil
                    } label: {
                        Text("Cancelar")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        guard let selectedImage = selectedImage else { return }
                        viewModel.createNewPost(caption: captionText,
                                                image: selectedImage) {
                            captionText = ""
                            self.postImage = nil
                            tabIndex = 0
                        }
                    } label: {
                        Text("Compartilhar")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            
            Spacer()
        }
    }
}


struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
