//
//  PostGridView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/16/23.
//

import SwiftUI

struct PostGridView: View {
    @EnvironmentObject var profileData: ProfileDataModel

    private static let initialColumns = 3.0
    
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: Int(initialColumns))

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(profileData.items) { item in
                        GeometryReader { geo in
                            NavigationLink(destination: PostView(post: item.post)) {
                                GridItemView(item: item, size: Double(geo.size.width))
                            }
                        }
                        .cornerRadius(2.0)
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Image Gallery")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView().environmentObject(ProfileDataModel())
    }
}
