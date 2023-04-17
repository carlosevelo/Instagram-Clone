//
//  FeedView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/17/23.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack (spacing: 0){
                FeedHeaderView()
                Divider()
                if viewModel.feed.isEmpty {
                    Spacer()
                    Text("No Posts to View")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(viewModel.feed, id: \.postId) { post in
                            PostView(post: post)
                        }
                    }
                }
            }
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
