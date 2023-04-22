//
//  ProfileView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/17/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    //@EnvironmentObject var profileData: ProfileDataModel
    @State var newPost = false
    
    var body: some View {
        GeometryReader { geo in
            VStack (spacing: 0) {
                ProfileHeaderView(profileViewModel: viewModel, newPost: newPost)
                Divider()
                ScrollView {
                    ProfileDetailsView(profileViewModel: viewModel)
                    PostGridView(profileViewModel: viewModel)
                }
                .refreshable {
                    viewModel.RefreshPosts()
                }
            }
            .environmentObject(viewModel)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
