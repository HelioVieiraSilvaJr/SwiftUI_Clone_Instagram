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
                    
                    TextField("Escreva seu comentário...", text: $captionText)
                }
                .padding()
                
                Button {
                    guard let selectedImage = selectedImage else { return }
                    viewModel.createNewPost(caption: captionText,
                                            image: selectedImage) {
                        captionText = ""
                        self.postImage = nil
                    }
                } label: {
                    Text("Compartilhar")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding()
                    
                }

            }
            
            Spacer()
        }
    }
}


struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
