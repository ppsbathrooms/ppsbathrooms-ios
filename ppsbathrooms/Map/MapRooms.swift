//
//  MapRooms.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/14/24.
//

import Foundation
import SwiftUI

struct BrButton: Hashable {
    let x: CGFloat
    let y: CGFloat
    let label: String
}

struct mapRooms {
    static let buttons: [BrButton] = [
        BrButton(x: 40, y: 80, label: "A"),
        BrButton(x: 40, y: 120, label: "B"),
        BrButton(x: 40, y: 160, label: "C"),

        BrButton(x: 320, y: 150, label: "D"),
        BrButton(x: 260, y: 200, label: "E"),
        BrButton(x: 300, y: 200, label: "F"),

    ]
}

#Preview(body: {
    ContentView()
})
