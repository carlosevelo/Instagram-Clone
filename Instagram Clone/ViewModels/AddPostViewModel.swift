//
//  AddPostViewModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/17/23.
//

import Foundation
import Firebase
import FirebaseStorage

class AddPostViewModel : ObservableObject {
    
    @Published var image: Data = Data()
    @Published var caption: String = ""
    
    func sharePost() {
        
    }
}
