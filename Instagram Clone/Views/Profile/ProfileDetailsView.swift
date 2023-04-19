//
//  ProfileDetailsView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/12/23.
//

import SwiftUI

struct ProfileDetailsView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var profileData: ProfileDataModel
    @State var showEditSheet = false
    @State var showAlert = false
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ZStack {
                        Circle()
                            .stroke()
                        Image(systemName: "person")
                    }
                    .frame(width: 100, height: 100)
                    HStack {
                        VStack {
                            Text("100")
                            Text("Posts")
                        }
                        VStack {
                            Text("1000")
                            Text("Followers")
                        }
                        VStack {
                            Text("1000")
                            Text("Following")
                        }
                    }
                    .frame(width: geo.size.width * 0.60)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text(profileData.name)
                    Text(profileData.bio)
                }
                .padding()
                .frame(width: geo.size.width, alignment: .leading)
                
                Spacer()
                HStack {
                    Spacer()
                    Button("Edit Profile") {
                        showEditSheet.toggle()
                    }
                    .sheet(isPresented: $showEditSheet) {
                        EditProfileView(showEditSheet: $showEditSheet)
                    }
                    Spacer()
                    Button("Share Profile") {
                        showAlert.toggle()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("This feature is not yet implemented."))
                    }
                    Spacer()
                }
                .padding()
                .padding(.bottom, 20)
                .frame(width: geo.size.width, height: 50)
            }
        }
        .frame(minHeight: 250, maxHeight: 500)
    }
}

struct ProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsView()
            .environmentObject(ProfileViewModel())
    }
}
