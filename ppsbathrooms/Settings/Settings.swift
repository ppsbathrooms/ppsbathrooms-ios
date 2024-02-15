//
//  settingsPannels.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/12/24.
//

import Foundation
import SwiftUI

struct Pannel: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    let destinationView: AnyView
}

struct PannelSection: Identifiable {
    let id = UUID()
    let name: String
    let pannels: [Pannel]
}

struct Settings {
    
    static let sampleData = Pannel(name: "profile",
                                   imageName: "person.crop.circle",
                                   description: "test profile",
                                   destinationView: AnyView(AccountView()))
    
    static let pannelSections = [
        PannelSection(name: "", pannels: [ // account
            Pannel(name: "Account", imageName: "person.crop.circle", description: "this is a cool profile panel", destinationView: AnyView(AccountView())),
        ]),
        
        PannelSection(name: "", pannels: [ // random test stuff
            Pannel(name: "More 1", imageName: "gear", description: "this is a cool unfinished panel", destinationView: AnyView(More1View())),
            Pannel(name: "More 2", imageName: "gear", description: "this is a cool unfinished panel", destinationView: AnyView(More2View())),
        ]),
    ]
}
