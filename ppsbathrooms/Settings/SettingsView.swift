//
//  SettingsView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/12/24.
//

import SwiftUI


struct SettingsView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(Settings.pannelSections) { pannelSection in
                    Section(header: Text(pannelSection.name)) {
                        ForEach(pannelSection.pannels.filter {
                            searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                        }) { pannel in
                            NavigationLink(destination: pannel.destinationView) {
                                Label(pannel.name, systemImage: pannel.imageName)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .searchable(text: $searchText)
        }
        .accentColor(Color(.label))
    }
}

#Preview {
    SettingsView()
}
