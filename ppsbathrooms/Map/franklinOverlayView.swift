////
////  franklinOverlayView.swift
////  ppsbathrooms
////
////  Created by Finn Price on 2/22/24.
////
//
//import SwiftUI
//import MapKit
//
//struct FranklinOverlayView: View {
//    @State private var region = MKCoordinateRegion(
//                center: CLLocationCoordinate2D(
//                    latitude: 45.502181,
//                    longitude: -122.607263),
//                span: MKCoordinateSpan(
//                    latitudeDelta: 0.003,
//                    longitudeDelta: 0.003)
//                )
//
//    var body: some View {
//        Map(coordinateRegion: $region)
//            .edgesIgnoringSafeArea(.all)
//            .overlay(
//                Image("franklinMap")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100) // Adjust the size as needed
//                    .offset(x: 20, y: 20) // Adjust the position as needed
//            )
//    }
//}
//
//#Preview {
//    FranklinOverlayView()
//}
