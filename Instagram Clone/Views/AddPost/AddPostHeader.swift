//
//  AddPostHeader.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/17/23.
//

import SwiftUI

struct AddPostHeader: View {
    var addPostViewModel: AddPostViewModel
    @Binding var newPost: Bool
    @Binding var showAddPostSheet: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(Color(UIColor.systemBackground))
                HStack(alignment: .center) {
                    Button {
                        showAddPostSheet.toggle()
                    } label: {
                        Text("Cancel")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    .frame(width: geometry.size.width * 0.25)
                    
                    Text("New Post")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.horizontal, 15.0)
                        .frame(width: geometry.size.width * 0.50)
                    
                    Button {
                        addPostViewModel.sharePost()
                        newPost = true
                        showAddPostSheet.toggle()
                    } label: {
                        Text("Share")
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

//struct AddPostHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPostHeader(showAddPostSheet: false)
//    }
//}
