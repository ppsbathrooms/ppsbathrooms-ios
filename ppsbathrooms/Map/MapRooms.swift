//
//  MapRooms.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/14/24.
//

import Foundation
import SwiftUI

struct RoomInfo: Identifiable {
    let id = UUID()
    let position: CGPoint
    let size: CGSize
    let color: Color
}
struct mapRooms {
    static let franklin = [
        RoomInfo(position: CGPoint(x: 75, y: 75), size: CGSize(width: 100, height: 100), color: .blue),
        RoomInfo(position: CGPoint(x: 250, y: 100), size: CGSize(width: 100, height: 100), color: .green),
        RoomInfo(position: CGPoint(x: 125, y: 250), size: CGSize(width: 100, height: 100), color: .yellow),
        RoomInfo(position: CGPoint(x: 275, y: 275), size: CGSize(width: 100, height: 100), color: .red)
    ]
}
