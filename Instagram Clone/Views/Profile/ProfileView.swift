//
//  ProfileView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/17/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack (spacing: 0) {
                ProfileHeaderView()
                Divider()
                ScrollView {
                    ProfileDetailsView()
                    PostGridView()
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
