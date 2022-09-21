//
//  UploadImage.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 18/09/22.
//

import UIKit
import FirebaseStorage

class UploadImage {
    
    enum UploadType {
        case profile, post
        
        var filePath: StorageReference {
            let filename = NSUUID().uuidString
            switch self {
            case .profile:
                return Storage.storage().reference(withPath: "/profile_images/\(filename)")
            case .post:
                return Storage.storage().reference(withPath: "/post_images/\(filename)")
            }
        }
        
        var compressionQuality: CGFloat {
            switch self {
            case .profile: return 0.5
            case .post: return 0.7
            }
        }
    }
    
    static func send(_ image: UIImage, type: UploadType, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: type.compressionQuality) else { return }
        let ref = type.filePath
        
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
