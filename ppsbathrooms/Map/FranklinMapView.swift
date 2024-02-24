//
//  FranklinMapView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/12/24.
//

import SwiftUI

struct Data: Codable {
    let open: Int
}

struct FranklinMapView: View {
    @State private var tappedRoom: String = ""
    @State private var brData: [[Int]] = []
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    RoomButtons(coordinates: mapRooms.buttons, brData: brData)
                    VStack {
                        Image(uiImage: UIImage(named: "franklinMap\(colorScheme == .light ? "Inverted" : "")")!)
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .padding(.top, 50)
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
            .background(Color("121211"))
            
            Header()
        }
    }
    
    
    func fetchBrData() {
        guard let url = URL(string: "https://ppsbathrooms.org/data.json") else {
            print("invalid url")
            return
        }

        ApiManager.fetchData(from: url) { jsonString in
            guard let jsonData = jsonString.data(using: .utf8) else {
                print("Failed to convert JSON string to data.")
                return
            }

            do {
                let stringArray = try JSONDecoder().decode([String].self, from: jsonData)

                let arraysOfInts = stringArray.map { string in
                    return string.components(separatedBy: ",").compactMap { Int($0) }
                }

                DispatchQueue.main.async {
                    self.brData = arraysOfInts
                }
            } catch {
                print("Error decoding JSON:", error)
            }
        }
    }
}

struct RoomButtons: View {
    var coordinates: [BrButton]
    var brData: [[Int]]

    var body: some View {
        ZStack {
            
            ForEach(coordinates, id: \.self) { coordinate in
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 15, height: 15)
                    .position(x: coordinate.x, y: coordinate.y)
                    .foregroundStyle(determineBrColor(id: coordinate.id))
                    .onTapGesture {
                        print(coordinate.id)
                    }
                
                // debug text
                
//                Text("\(coordinate.id)")
//                    .position(x: coordinate.x, y: coordinate.y)
//                    .foregroundStyle(.black)
//                    .font(.system(size: 10))
            }
        }
    }
    
    func determineBrColor(id: Int) -> Color {
        guard brData.indices.contains(1) else {
            // handle the case where there is no second array in brData
            // while fetching data / no connection
            return Color(.gray)
        }

        let secondArray = brData[1]

        guard secondArray.indices.contains(id) else {
            // handle the case where id is out of bounds for the second array
            print("Index \(id) out of bounds for the second array.")
            return Color(.blue)
        }

        let element = secondArray[id]
        return element == 0 ? Color(.red) : Color(.green)
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

struct Header: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Rectangle()
                        .fill(Color("121211"))
                        .ignoresSafeArea(.all)
                        .shadow(
                            color: Color("shadow"),
                            radius: CGFloat(10)
                        )
                        .frame(width: geometry.size.width, height: 50)
                    Spacer()
                }
                VStack {
                    Text("ppsbathrooms")
                        .font(.title)
                        .bold()
                    Spacer()
                }
            }
        }
    }
}
