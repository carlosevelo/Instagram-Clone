//
//  FeedView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/17/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            PostView()
            PostView()
            PostView()
            PostView()
            PostView()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
