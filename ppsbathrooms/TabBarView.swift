//
//  TabBarView.swift
//  ppsbathrooms
//
//  Created by Finn Price on 2/14/24.
//

import SwiftUI

public enum Tab: String, CaseIterable {
    case map
    case person
//    case gearshape
}

struct TabBarView: View {
    
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .foregroundColor(selectedTab == tab ? Color(.label) : .gray)
                        .font(.system(size: 25))
                        .padding(20)
                        .padding(.bottom, 5)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(height: 80)
            .background(.thinMaterial)
        }
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    TabBarView(selectedTab: .constant(.map))
}
