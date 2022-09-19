//
//  SearchView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 14/09/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var isSearchMode = false
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isSearchMode)
                .padding()
            
            if isSearchMode {
                UserListView()
            } else {
                PostGridView()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
