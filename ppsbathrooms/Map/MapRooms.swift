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
    let id: Double
}

struct mapRooms {
    static let buttons: [BrButton] = [
        // floor 1
        BrButton(x: 55, y: 85, id: 0.1),
        BrButton(x: 55, y: 120, id: 0.2),
        BrButton(x: 55, y: 145, id: 0.3),
        BrButton(x: 310, y: 155, id: 0.4),
        BrButton(x: 255, y: 195, id: 0.5),
        BrButton(x: 280, y: 195, id: 0.6),
        
        // floor 2
        BrButton(x: 48, y: 410, id: 1.1),
        BrButton(x: 48, y: 490, id: 1.2),
        BrButton(x: 110, y: 375, id: 1.3),
        BrButton(x: 120, y: 290, id: 1.4),
        BrButton(x: 195, y: 310, id: 1.5),
        BrButton(x: 220, y: 310, id: 1.6),
        BrButton(x: 290, y: 310, id: 1.7),
        BrButton(x: 95, y: 410, id: 1.8),
        BrButton(x: 95, y: 410, id: 1.9),
        BrButton(x: 190, y: 435, id: 1.10),
        BrButton(x: 245, y: 385, id: 1.11),
        BrButton(x: 285, y: 435, id: 1.12),
        BrButton(x: 365, y: 343, id: 1.13),
        BrButton(x: 365, y: 368, id: 1.14),
        
        // floor 3
        BrButton(x: 290, y: 555, id: 2.1),
        BrButton(x: 265, y: 555, id: 2.2),
        BrButton(x: 190, y: 555, id: 2.3),
        BrButton(x: 215, y: 555, id: 2.4),
        BrButton(x: 115, y: 540, id: 2.5),
        BrButton(x: 190, y: 701, id: 2.6),
        
        // gym
        BrButton(x: 20, y: 890, id: 3.1),
        BrButton(x: 20, y: 915, id: 3.2),
        BrButton(x: 135, y: 840, id: 3.3),
        BrButton(x: 135, y: 865, id: 3.4),
        BrButton(x: 145, y: 910, id: 3.5),
        BrButton(x: 145, y: 935, id: 3.6),
        BrButton(x: 195, y: 975, id: 3.7),
    ]
}

#Preview(body: {
    FranklinMapView()
})
