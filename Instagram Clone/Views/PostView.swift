//
//  PostView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/20/23.
//

import SwiftUI

struct PostView: View {
    var post: Post
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 35, height: 35)
//                    Image(uiImage: UIImage(imageLiteralResourceName: post.user?.profileImageUrl ?? "default"))
//                        .resizable()
//                        .frame(width: 35, height: 35)
                    Text(post.user?.username ?? "No Username")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .padding([.leading, .trailing])
                Image(uiImage: UIImage(imageLiteralResourceName: post.media))
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.width)
                HStack {
                    Group {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .padding(.leading)
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .padding(.leading, 8)
                        Image(systemName: "paperplane")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .padding(.leading, 8)
                    }
                    Spacer()
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 25.0, height: 25.0)
                        .padding(.trailing)
                }
                Text("Liked by 1234 people")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 1)
                    .frame(width: geometry.size.width, alignment: .leading)
                HStack {
                    Text(post.user?.username ?? "No username")
                        .fontWeight(.bold)
                        .padding(.leading)
                    Text(post.caption)
                        .padding(.trailing)
                }
                .padding(.bottom, 1)
                .frame(width: geometry.size.width, alignment: .leading)
                Text("View all 20 Comments")
                    .foregroundColor(Color.gray)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 1)
                    .frame(width: geometry.size.width, alignment: .leading)
                Text("Add Comment...")
                    .foregroundColor(Color.gray)
                    .padding([.leading, .trailing])
                    .padding(.bottom, 1)
                    .frame(width: geometry.size.width, alignment: .leading)
            }
        }
        .frame(height: 630)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(userId: 1, caption: "caption", date: Date(), media: "post"))
    }
}
