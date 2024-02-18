//
//  FranklinMapView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/12/24.
//

import SwiftUI

struct FranklinMapView: View {
    @State private var tappedRoom: String = ""
    @State private var brData: String = ""
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
                        .frame(height: 75)
                }
                .allowsHitTesting(false)
            }
        }
        .onAppear {
            fetchBrData()
        }
        .refreshable {
            fetchBrData()
        }
    }
    
    
    func fetchBrData() {
        guard let url = URL(string: "https://ppsbathrooms.org/data.json") else {
            print("invalid url")
            return
        }

        ApiManager.fetchData(from: url) { data in
            self.brData = data
            print(brData)
        }
    }

}

struct RoundedSquareView: View {
    var coordinates: [BrButton]

    var body: some View {
        ZStack {
            ForEach(coordinates, id: \.self) { coordinate in
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 15, height: 15)
                    .position(x: coordinate.x, y: coordinate.y)
                    .foregroundStyle(.green)
                    .onTapGesture {
                        print(coordinate.id)
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
