//
//  AddPostViewModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/17/23.
//

import SwiftUI
import PhotosUI
import CoreTransferable

class AddPostViewModel : ObservableObject {
    var postService = PostService()
    
    var imageData: Data?
    var caption: String = ""
    
    // MARK: - Profile Image
    
    enum ImageState {
        case empty
        case success(UIImage)
        case failure(Error)
    }
            
    @Published private(set) var imageState: ImageState = .empty
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
                if let imageSelection {
                    processPhoto(photo: imageSelection)
                }
            }
    }
    
    func processPhoto(photo: PhotosPickerItem) {
        photo.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let data, let image = UIImage(data: data) {
                        self.imageData = data
                        self.imageState = .success(image)
                    }
                case .failure(let error):
                    self.imageState = .failure(error)
                }
            }
        }
    }
    
    //MARK: - User Intents
    
    func sharePost() {
        if self.imageData != nil {
            postService.CreatePost(imageData: self.imageData!, caption: self.caption)
        }
    }
}
