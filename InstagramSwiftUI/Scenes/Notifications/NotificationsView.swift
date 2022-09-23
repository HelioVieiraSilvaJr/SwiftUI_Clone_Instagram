//
//  NotificationsView.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 14/09/22.
//

import SwiftUI

struct NotificationsView: View {
    @ObservedObject var notificationsManager = NotificationsManager.shared
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(notificationsManager.notifications) { notification in
                    NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
