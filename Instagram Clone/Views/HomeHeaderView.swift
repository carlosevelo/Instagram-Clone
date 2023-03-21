//
//  HomeHeaderView.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 3/13/23.
//

import SwiftUI

struct HomeHeaderView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(UIColor.systemBackground))
                    HStack(alignment: .center) {
                        Text("Instagram")
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 15.0)
                        Spacer()
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .padding(.horizontal, 15.0)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        Image(systemName: "message")
                        //                        .onTapGesture {
                        //
                        //                        }
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .padding(.horizontal, 15.0)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
                    .foregroundColor(Color.white)
                }
                .frame(width: geometry.size.width, height: 50)
            }
        }
        .frame(height: 50)
        //.background(Color(UIColor.systemBackground))
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}
