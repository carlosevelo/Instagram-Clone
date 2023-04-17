//
//  GridItemView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/16/23.
//

import SwiftUI

struct GridItemView: View {
    let item: Item
    let size: Double

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(uiImage: UIImage(imageLiteralResourceName: item.post.url))
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
//            AsyncImage(url: URL(string: item.post.url)) { image in
//                image
//                    .resizable()
//                    .scaledToFill()
//            } placeholder: {
//                ProgressView()
//            }
//            .frame(width: 50, height: 50)
        }
    }
}

struct GridItem_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(item: Item(post: DummyData.dummyPost), size: 80)
    }
}
