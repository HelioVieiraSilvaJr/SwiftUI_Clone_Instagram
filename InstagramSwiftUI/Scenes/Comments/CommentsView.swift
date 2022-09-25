//
//  CommentsView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 22/09/22.
//

import SwiftUI

struct CommentsView: View {
    @State var textComment = ""
    @ObservedObject var viewModel: CommentsViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(viewModel.comments) { comment in
                    CommentsCell(viewModel: CommentCellViewModel(comment: comment))
                }
            }
        }
        .padding(.top)
        
        CustomInputText(inputText: $textComment, action: handlerSendComment)
    }
    
    func handlerSendComment() {
        viewModel.send(comment: textComment)
        textComment = ""
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(viewModel: CommentsViewModel(post: PostModel(caption: "",
                                                                  timestamp: Date(),
                                                                  likes: 0,
                                                                  imageUrl: "",
                                                                  ownerUid: "",
                                                                  ownerImageUrl: "",
                                                                  ownerUsername: "")))
    }
}
