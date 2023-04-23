//
//  PostView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/20/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    @StateObject var postVM = PostViewModel()
    @State var post: Post
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    if post.user.profileImageUrl != nil {
                        AsyncImage(url: post.user.profileImageUrl) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 35, height: 35)
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                    
                    Text(post.user.username)
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .padding([.leading, .trailing])
                
                AsyncImage(url: post.url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: geometry.size.width, height: geometry.size.width)
                
                HStack {
                    Group {
                        Image(systemName: "heart")
                            .resizable()
                            .onTapGesture {
                                post.likes += 1
                                postVM.LikePost(post)
                            }
                            .frame(width: 25.0, height: 25.0)
                            .padding(.leading)
                        NavigationLink(destination: ComingSoonView()) {
                            Image(systemName: "message")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                                .padding(.leading, 8)
                        }
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
                if post.likes > 0 {
                    Text("Liked by \(post.likes) people")
                        .fontWeight(.bold)
                        .padding([.leading, .trailing])
                        .padding(.bottom, 1)
                        .frame(width: geometry.size.width, alignment: .leading)
                }
                HStack {
                    Text(post.user.username)
                        .fontWeight(.bold)
                        .padding(.leading)
                    Text(post.caption)
                        .padding(.trailing)
                }
                .padding(.bottom, 1)
                .frame(width: geometry.size.width, alignment: .leading)
                if post.comments.count > 0 {
                    Text("View all \(post.comments.count) Comments")
                        .foregroundColor(Color.gray)
                        .padding([.leading, .trailing])
                        .padding(.bottom, 1)
                        .frame(width: geometry.size.width, alignment: .leading)
                }
            }
        }
        .frame(height: 630)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(user: DummyData.dummyUser, caption: "caption", date: Date(), url: URL(string: "https://firebasestorage.googleapis.com/v0/b/instagram-clone-93149.appspot.com/o/posts%2FDa0fxnRxHffxGtnSH05EtJl95lZ2%2F89BB5362-D345-49D1-9BA9-6AEBCBC9AEA6.jpeg?alt=media&token=78c4885b-a9bb-4fb7-9931-f972bd19008c")))
    }
}
