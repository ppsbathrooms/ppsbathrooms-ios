//
//  FranklinMapView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/12/24.
//

import SwiftUI

struct FranklinMapView: View {
    var body: some View {
        VStack {
            Text("ppsbathrooms")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            ScrollView {
                MapView(school: "franklin", mapFloor: 0)
                MapView(school: "franklin", mapFloor: 1)
                MapView(school: "franklin", mapFloor: 2)
                Spacer()
                    .frame(height: 150)
            }

        }

    }
}



#Preview {
    ContentView()
}

struct MapView: View {
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
