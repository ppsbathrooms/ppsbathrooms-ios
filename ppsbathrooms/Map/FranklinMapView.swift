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
                ForEach(mapRooms.franklin) { room in
                    //                    Rectangle()
                    //                        .frame(width: room.size.width, height: room.size.height)
                    //                        .position(room.position)
                    //                        .foregroundColor(room.color)
                    //                        .onTapGesture {
                    //                            print("tapped \(room.color)")
                    //                        }
                }
                
                VStack {
                    Text("ppsbathrooms")
                        .font(.title)
                        .fontWeight(.bold)
                    VStack {
                        Image(uiImage: UIImage(named: "franklinMap\(colorScheme == .light ? "Invert" : "")")!)
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
