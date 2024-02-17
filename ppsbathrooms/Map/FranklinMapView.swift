//
//  FranklinMapView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/12/24.
//

import SwiftUI

struct FranklinMapView: View {
    @State private var tappedRoom: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            ZStack {
                RoundedSquareView(coordinates: mapRooms.buttons)
                VStack {
                    Text("ppsbathrooms")
                        .font(.title)
                        .fontWeight(.bold)
                    VStack {
                        Image(uiImage: UIImage(named: "franklinMap\(colorScheme == .light ? "Inverted" : "")")!)
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                    Spacer()
                        .frame(height: 150)
                }
                .allowsHitTesting(false)
                
            }
        }
    }
    

}

struct RoundedSquareView: View {
    var coordinates: [BrButton]

    var body: some View {
        ZStack {
            ForEach(coordinates, id: \.self) { coordinate in
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: 25, height: 25)
                    .position(x: coordinate.x, y: coordinate.y)
                    .foregroundStyle(.green)
                    .onTapGesture {
                        print("\(coordinate.label)")
                    }
            }
        }
    }
}


struct MapView: View {
    @Environment(\.colorScheme) var colorScheme
    var school: String
    var mapFloor: Int

    var body: some View {
        Text("Floor \(mapFloor)")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title3)
            .fontWeight(.light)
            .padding()
        
        Image(uiImage: UIImage(named: "\(school)\(mapFloor)")!)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 200)
            .padding()
    }
}


#Preview(body: {
    ContentView()
})
