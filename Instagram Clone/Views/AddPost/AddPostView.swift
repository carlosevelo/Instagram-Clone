//
//  AddPostView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/17/23.
//

import SwiftUI
import PhotosUI

struct AddPostView: View {
    @ObservedObject var addPostViewModel = AddPostViewModel()

    @State var selectedItem: [PhotosPickerItem] = []
    @Binding var showAddPostSheet: Bool
    @State var showPhotosPicker = false
    @State var data: Data?
    @State var image: Image?
    @State var caption: String = ""
    
    var body: some View {
        VStack {
            AddPostHeader(showAddPostSheet: $showAddPostSheet)
                .environmentObject(addPostViewModel)
            Divider()
            GeometryReader { geo in
                HStack(spacing: 0) {
                    Group {
                        PhotosPicker(
                            selection: $selectedItem,
                            maxSelectionCount: 1,
                            matching: .images,
                            photoLibrary: .shared()
                        ) {
                            if let image = UIImage(data: $addPostViewModel.image.wrappedValue) {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }
                            else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }
                        }
                        .onChange(of: selectedItem) { newValue in
                             guard let item = selectedItem.first else {
                                 return
                             }
                            
                            item.loadTransferable(type: Data.self) { result in
                                switch result {
                                case.success(let data):
                                    if let data = data {
                                        self.addPostViewModel.image = data
                                    } else {
                                        print("Data is nil.")
                                    }
                                case.failure(let failure):
                                    fatalError("\(failure)")
                                }
                            }
                        }
                        
                    }
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
//    @Binding var showAddPostSheet: Bool = false
//
//    static var previews: some View {
//        AddPostView(showAddPostSheet: $showAddPostSheet)
//    }
//}
