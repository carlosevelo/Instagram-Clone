//
//  MainView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/17/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .clipped()
            DiscoverView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            ReelsView()
                .tabItem {
                    Image(systemName: "video.circle")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
                .clipped()
        }
        .toolbar(.visible, for: .tabBar)
        .toolbarBackground(Color.white, for: .tabBar)
        .onAppear {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
