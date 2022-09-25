//
//  LazyView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 25/09/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
