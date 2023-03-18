//
//  HomeView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HomeHeaderView()
            Spacer()
            NavBarView()
                .foregroundColor(Color.blue)
                .frame(height: 90)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            //.background(.black)
    }
}
