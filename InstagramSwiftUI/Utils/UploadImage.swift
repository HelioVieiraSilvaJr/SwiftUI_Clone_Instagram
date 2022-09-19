//
//  UploadImage.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 18/09/22.
//

import UIKit
import FirebaseStorage

class UploadImage {
    
    static func image(_ image: UIImage, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: Erro ao fazer upload da imagem (\(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageURL = url?.absoluteString else { return }
                print("Upload da imagem realizado com sucesso!")
                completion(imageURL)
            }
        }
    }
}
