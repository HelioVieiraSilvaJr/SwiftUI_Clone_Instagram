//
//  Date+Extension.swift
//  InstagramSwiftUI
//
//  Created by Helio Junior on 23/09/22.
//

import Foundation

extension Date {
    var timeAgo: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth, .month, .year]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self, to: Date()) ?? "-"
    }
}
