//
//  EditProfileHeader.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/17/23.
//

import SwiftUI

struct EditProfileHeader: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @Binding var showEditSheet: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(Color(UIColor.systemBackground))
                HStack(alignment: .center) {
                    Button {
                        showEditSheet.toggle()
                    } label: {
                        Text("Cancel")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    .frame(width: geometry.size.width * 0.25)
                    
                    Text("Edit Profile")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.horizontal, 15.0)
                        .frame(width: geometry.size.width * 0.50)
                    
                    Button {
                        profileViewModel.SaveProfile()
                        showEditSheet.toggle()
                    } label: {
                        Text("Done")
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

//struct EditProfileHeader_Previews: PreviewProvider {
//    @State var showEditSheet: Bool
//    static var previews: some View {
//        EditProfileHeader(showEditSheet: $showEditSheet).environmentObject(ProfileViewModel())
//    }
//}
