//
//  FireStorageImplementation.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import Foundation
import FirebaseStorage
// conforming to FireStorageService protocol
// implementation should hold all the logic behind functions we defined in protocol
class StorageServiceImplementation: FireStorageService {
    private init() {}
    static let shared = StorageServiceImplementation()
    // Similare to Database.database in FirebaseDatabase
    private let storage = Storage.storage()
    // Reference for all images(kind of lika a folder)
    private lazy var imagesReference = storage.reference().child("images")
    // Function to upload Image. Takes in UIimage and converts it to url for Storage
    func uploadImage (_ image: UIImage, completion: @escaping (String) -> Void) {
        // Creating individual image reference
        let imageRef = imagesReference.child("\(UUID().uuidString).jpg")
        // Making sure that image exists
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        // Uploading image to Storage
        imageRef.putData(imageData, metadata: nil) { (_ , error) in
            if let unwrappedError = error {
                print (unwrappedError)
            } else {
                // getting URL to convert it to image for cell
                imageRef.downloadURL { (url, downloadError) in
                    if let unwrappedDownloaderror = downloadError {
                        print(unwrappedDownloaderror)
                    } else if let imageUrl = url {
                        completion (imageUrl.absoluteString)
                    }
                }
            }
        }
    }
}
