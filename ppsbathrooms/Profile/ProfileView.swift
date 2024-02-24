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
    
    var body: some View {
        NavigationStack {
            Form {
                UserInfoTop(username: username)
                
                UpdateUsername(username: $username)
                
                UpdateSchool(selectedSchool: $selectedSchool)
                
                UpdateBrPrefs(brPrefs: $brPrefs)
                
                UpdateSchedule(classes: $classes)
                
                ResetPrefs(showAlert: $showAlert)
                Section {
                    Text(".")
                }
                .opacity(0)
                .listRowInsets(EdgeInsets())
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
}

#Preview {
    ProfileView()
}

struct ProfilePicture: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 150)
                .foregroundColor(.clear)
                .overlay(
                    Circle()
                        .stroke(Color.primary, lineWidth: 2)
                )
            Text("pic")
        }
    }
}

struct UserInfoTop: View {
    var username: String
    var body: some View {
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
    }
}

struct UpdateUsername: View {
    @Binding var username: String
    var body: some View {
        Section(header: Text("Username")) {
            TextField("Enter your name", text: $username)
                .onReceive(username.publisher.collect()) {
                    username = String($0.prefix(30))
                }
        }
    }
}

struct UpdateSchool: View {
    @Binding var selectedSchool: String
    let schools = ["Cleveland", "Franklin", "Wells"]

    var body: some View {
        Section {
            Picker("School", selection: $selectedSchool) {
                ForEach(schools, id: \.self) { school in
                    Text(school)
                }
            }
            .tint(.white)
            .pickerStyle(.menu)
        }
    }
}

struct UpdateBrPrefs: View {
    @Binding var brPrefs: [String]
    
    var body: some View {
        Section(header: Text("Bathroom Preferences")) {
            Toggle("All Gender", isOn: toggleBinding(for: "All Gender"))
            Toggle("Male", isOn: toggleBinding(for: "Male"))
            Toggle("Female", isOn: toggleBinding(for: "Female"))
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

struct UpdateSchedule: View {
    @Binding var classes: [String]
    var body: some View {
        Section(header: Text("Schedule")) {
            ForEach(0..<8, id: \.self) { index in
                TextField("Period \(index + 1)", text: $classes[index])
            }
        }
    }
}

struct ResetPrefs: View {
    @Binding var showAlert: Bool
    var body: some View {
        Button(action: {
            showAlert = true
        }) {
            Text("Reset Preferences")
                .foregroundColor(.red)
        }
    }
}
