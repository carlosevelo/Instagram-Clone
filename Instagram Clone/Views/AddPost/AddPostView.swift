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

    @Binding var showAddPostSheet: Bool
    @State var showPhotosPicker = false
    
    var body: some View {
        VStack {
            AddPostHeader(addPostViewModel: addPostViewModel, showAddPostSheet: $showAddPostSheet)
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

struct AddPostHeader: View {
    var addPostViewModel: AddPostViewModel
    @Binding var showAddPostSheet: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(Color(UIColor.systemBackground))
                HStack(alignment: .center) {
                    Button {
                        showAddPostSheet.toggle()
                    } label: {
                        Text("Cancel")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    .frame(width: geometry.size.width * 0.25)
                    
                    Text("New Post")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.horizontal, 15.0)
                        .frame(width: geometry.size.width * 0.50)
                    
                    Button {
                        addPostViewModel.sharePost()
                        showAddPostSheet.toggle()
                    } label: {
                        Text("Share")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                    .frame(width: geometry.size.width * 0.25)
                }
                .foregroundColor(Color.white)
                .padding(.bottom, 5)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .frame(height: 50)
    }
}

//struct AddMediaView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPostView()
//    }
//}
