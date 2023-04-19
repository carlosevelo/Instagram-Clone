//
//  EditProfileView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/12/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var profileData: ProfileDataModel
    @Binding var showEditSheet: Bool
    @State var selectedItem: [PhotosPickerItem] = []
    @State var data: Data?
    @State var image: Image?
    
    var body: some View {
        EditProfileHeader(showEditSheet: $showEditSheet)
            .environmentObject(profileViewModel)
        Divider()
        VStack(spacing: 0) {
            PhotosPicker(selection: $selectedItem,
                         maxSelectionCount: 1,
                         matching: .images,
                         photoLibrary: .shared()) {
                if selectedItem.isEmpty {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 60, height: 60)
                } else {
                    if let data = data, let image = UIImage(data: data) {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                }
            }
            .padding()
            Divider()
            GeometryReader { geo in
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        Group {
                            Text("Name")
                            Text("Username")
                            Text("Bio")
                        }
                        .padding()
                        .frame(height: 40)
                        Spacer()
                    }
                    .frame(width: geo.size.width * 0.3, height: geo.size.height)
                    VStack(alignment: .leading, spacing: 0) {
                        TextField("Name", text: $profileData.name)
                            .padding(.horizontal)
                            .frame(height: 40)
                            .lineLimit(1)
                        Divider()
                        TextField("Username", text: $profileData.username)
                            .padding(.horizontal)
                            .frame(height: 40)
                            .lineLimit(1)
                        Divider()
                        TextField("Bio", text: $profileData.bio, axis: .vertical)
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .frame(minHeight: 40)
                            .multilineTextAlignment(.leading)
                            .lineLimit(8)
                        Divider()
                        Spacer()
                    }
                    .frame(width: geo.size.width * 0.70, height: geo.size.height)
                }
            }
            .frame(maxHeight: 300)
            Spacer()
        }
        
    }
}

//struct EditProfileSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
