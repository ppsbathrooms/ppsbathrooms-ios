//
//  FranklinMapView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/12/24.
//

import SwiftUI

struct FranklinMapView: View {
    @State private var tappedRoom: String = ""

    var body: some View {
        ZStack {
            ForEach(mapRooms.franklin) { room in
                Rectangle()
                    .frame(width: room.size.width, height: room.size.height)
                    .position(room.position)
                    .foregroundColor(room.color)
                    .onTapGesture {
                        print("tapped \(room.color)")
                    }
            }

            VStack {
                Text("ppsbathrooms")
                    .font(.title)
                    .fontWeight(.bold)
                ScrollView {
                    VStack {
                        MapView(school: "franklin", mapFloor: 0)
                        MapView(school: "franklin", mapFloor: 1)
                        MapView(school: "franklin", mapFloor: 2)
                    }
                   Spacer()
                        .frame(height: 150)
                }
            }
            .allowsHitTesting(false)

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
            .padding()    }
}


#Preview(body: {
    ContentView()
})
