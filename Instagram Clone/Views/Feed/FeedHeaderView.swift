//
//  FeedHeaderView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/13/23.
//

import SwiftUI

struct FeedHeaderView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var showAddPostSheet = false
    @StateObject var addPostViewModel = AddPostViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(Color(UIColor.systemBackground))
                VStack {
                    Spacer()
                    HStack(alignment: .center) {
                        Text("Instagram")
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 15.0)
                        Spacer()
                        Image(systemName: "plus.app")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .padding(.horizontal, 5.0)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .onTapGesture {
                                showAddPostSheet.toggle()
                            }
                            .sheet(isPresented: $showAddPostSheet) {
                                AddPostView(addPostViewModel: addPostViewModel, showAddPostSheet: $showAddPostSheet)
                            }
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .padding(.horizontal, 5.0)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .padding(.horizontal, 5.0)
                            .padding(.trailing, 15)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
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

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FeedHeaderView()
    }
}
