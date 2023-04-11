//
//  HomeView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            NavBarView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            //.background(.black)
    }
}
