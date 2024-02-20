//
//  ProfileView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/14/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var username: String = "Gregory Smith"
    @State private var selectedSchool: String = "Franklin"
    @State private var brPrefs: [String] = ["All Gender"]
    @State private var classes: [String] = Array(repeating: "", count: 8)
    
    @State private var showAlert = false
    
    let schools = ["Cleveland", "Franklin", "Wells"]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        ProfilePicture()
                        VStack {
                            Text(username)
                                .font(.title)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                                .fontWeight(.bold)
                            Text("Joined 0/1/1")
                        }
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .center)

                    }
                }
                .listRowInsets(EdgeInsets())
                .padding(.horizontal)
                .padding(.vertical, 2)
                .listRowBackground(Color.clear)
                
                Section(header: Text("Username")) {
                    TextField("Enter your name", text: $username)
                        .onReceive(username.publisher.collect()) {
                            username = String($0.prefix(30))
                        }
                }
                
                Section {
                    Picker("School", selection: $selectedSchool) {
                        ForEach(schools, id: \.self) { school in
                            Text(school)
                        }
                    }
                    .tint(.white)
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Bathroom Preferences")) {
                    Toggle("All Gender", isOn: toggleBinding(for: "All Gender"))
                    Toggle("Male", isOn: toggleBinding(for: "Male"))
                    Toggle("Female", isOn: toggleBinding(for: "Female"))
                }
                
                Section(header: Text("Schedule")) {
                    ForEach(0..<8, id: \.self) { index in
                        TextField("Period \(index + 1)", text: $classes[index])
                    }
                }
                
                Button(action: {
                    showAlert = true
                }) {
                    Text("Reset Preferences")
                        .foregroundColor(.red)
                }
                Spacer()
                    .frame(height: 45)
                    .listRowBackground(Color.clear)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Reset Preferences"),
                    message: Text("Are you sure you want to reset your preferences?"),
                    primaryButton: .destructive(Text("Reset")) {
                        classes = Array(repeating: "", count: 8)
                        username = "Gregory Smith"
                        brPrefs = ["All Gender"]
                        selectedSchool = "Franklin"
                    },
                    secondaryButton: .cancel()
                )
                
            }
        }
    }
    
    private func toggleBinding(for gender: String) -> Binding<Bool> {
        Binding(
            get: { self.brPrefs.contains(gender) },
            set: { newValue in
                if newValue {
                    self.brPrefs.append(gender)
                } else {
                    self.brPrefs.removeAll { $0 == gender }
                }
            }
        )
    }

}

#Preview {
    ContentView()
}

struct ProfilePicture: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 150)
                .foregroundColor(.clear)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                )
            Text("pic")
        }
    }
}
