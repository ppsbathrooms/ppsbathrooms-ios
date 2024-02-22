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
    let id: Int
}

struct mapRooms {
    static let buttons: [BrButton] = [
        // floor 1
        BrButton(x: 55, y: 85, id: 1),
        BrButton(x: 55, y: 120, id: 2),
        BrButton(x: 55, y: 145, id: 6),
        BrButton(x: 310, y: 155, id: 5),
        BrButton(x: 255, y: 195, id: 3),
        BrButton(x: 280, y: 195, id: 4),
        
        // floor 2
        BrButton(x: 48, y: 410, id: 8),
        BrButton(x: 48, y: 490, id: 9),
        BrButton(x: 110, y: 375, id: 7),
        BrButton(x: 120, y: 290, id: 0),
        BrButton(x: 195, y: 310, id: 28),
        BrButton(x: 220, y: 310, id: 29),
        BrButton(x: 290, y: 310, id: 31),
        BrButton(x: 290, y: 285, id: 30),
        BrButton(x: 95, y: 410, id: 27),
        BrButton(x: 190, y: 435, id: 26),
        BrButton(x: 245, y: 385, id: 32),
        BrButton(x: 285, y: 435, id: 33),
        BrButton(x: 365, y: 343, id: 20),
        BrButton(x: 365, y: 368, id: 21),
        
        // floor 3
        BrButton(x: 265, y: 555, id: 24),
        BrButton(x: 290, y: 555, id: 25),
        BrButton(x: 190, y: 555, id: 22),
        BrButton(x: 215, y: 555, id: 23),
        BrButton(x: 115, y: 540, id: 10),
        BrButton(x: 190, y: 701, id: 11),
        
        // gym
        BrButton(x: 20, y: 890, id: 14),
        BrButton(x: 20, y: 915, id: 15),
        BrButton(x: 135, y: 840, id: 12),
        BrButton(x: 135, y: 865, id: 13),
        BrButton(x: 145, y: 910, id: 16),
        BrButton(x: 145, y: 935, id: 17),
        BrButton(x: 195, y: 975, id: 18),
        BrButton(x: 83, y: 975, id: 19),

    ]
}

#Preview(body: {
    FranklinMapView()
})
