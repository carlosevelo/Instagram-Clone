//
//  ProfileHeaderView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/11/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var profileData: ProfileDataModel
    @ObservedObject var profileViewModel = ProfileViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var showAddPostSheet = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(Color(UIColor.systemBackground))
                VStack {
                    Spacer()
                    HStack(alignment: .center) {
                        Text("\(profileData.username)")
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 15.0)
                        Spacer()
                        Image(systemName: "plus.app")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .padding(.horizontal, 15.0)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .onTapGesture {
                                showAddPostSheet.toggle()
                            }
                            .sheet(isPresented: $showAddPostSheet) {
                                AddPostView(addPostViewModel: AddPostViewModel(), showAddPostSheet: $showAddPostSheet)
                            }
                        Button {
                            authService.SignOut()
                        } label: {
                            Text("Sign Out")
                                .font(.body)
                                .foregroundColor(.black)
                        }
                        .padding(.trailing)
                    }
                    .foregroundColor(Color.white)
                    .padding(.bottom, 5)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .frame(height: 50)
    }

}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
