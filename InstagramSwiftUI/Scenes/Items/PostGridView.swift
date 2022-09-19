//
//  PostGridView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 15/09/22.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items) {
            ForEach(0 ..< 10) { _ in
                NavigationLink(destination: FeedView()) {
                    Image("foto1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
