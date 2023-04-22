//
//  AddPostView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/17/23.
//

import SwiftUI
import PhotosUI

struct AddPostView: View {
    @StateObject var addPostViewModel: AddPostViewModel
    @Binding var newPost: Bool

    @Binding var showAddPostSheet: Bool
    @State var showPhotosPicker = false
    
    var body: some View {
        VStack {
            AddPostHeader(addPostViewModel: addPostViewModel, newPost: $newPost, showAddPostSheet: $showAddPostSheet)
            Divider()
            GeometryReader { geo in
                HStack(spacing: 0) {
                    Group {
                        switch addPostViewModel.imageState {
                            case .success(let image):
                                Image(uiImage: image)
                                    .resizable()
                            case .empty:
                                Image(systemName: "photo")
                                    .resizable()
                            case .failure:
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .resizable()
                        }
                    }
                    .opacity(0.75)
                    .overlay(alignment: .bottomTrailing) {
                        PhotosPicker(selection: $addPostViewModel.imageSelection,
                                     matching: .images,
                                     photoLibrary: .shared()) {
                            Image(systemName: "pencil.circle.fill")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 20))
                                .foregroundColor(.accentColor)
                        }
                        .buttonStyle(.borderless)
                    }
                    .frame(width: 60, height: 60)
                    .padding()
                    .frame(width: geo.size.width * 0.2, height: geo.size.height)
                    
                    GeometryReader { captionGeo in
                        TextField("Write a caption...", text: $addPostViewModel.caption)
                            .foregroundColor(.gray)
                            .frame(width: captionGeo.size.width, height: captionGeo.size.height, alignment: .top)
                    }
                    .padding()
                    .frame(width: geo.size.width * 0.8, height: geo.size.height)
                }
            }
            .padding()
            .frame(height: 100)
            
            Group {
                Form {
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Tag people")
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Tag products")
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Add location")
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Add music")
                    }
                    NavigationLink(destination: ComingSoonView()) {
                        Text("Advanced settings")
                    }
                }
            }
        }
        
        
    }
}

//struct AddMediaView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPostView()
//    }
//}
