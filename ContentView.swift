//
//  ContentView.swift
//  Timeline
//
//  Created by Dmytro Honcharenko on 12.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var content = []

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 7) {
                        TimelineCellView()
                        TimelineCellView()
                        TimelineCellView()
                        TimelineCellView()
                        TimelineCellView()
                        TimelineCellView()
                        TimelineCellView()
                    }
                    .padding(24)
                }

                Button(action: {}) {
                    Text("New event...")
                        .padding()
                        .foregroundStyle(.black.opacity(0.85))
                        .backgroundStyle(.red)
                        
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            .navigationTitle("Timeline")
            .scrollIndicators(.never)
        }
    }
}

#Preview {
    ContentView()
}

struct TimelineCellView: View {
    let cellHeight: CGFloat = 200
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundStyle(.gray.quinary)
                .frame(width: cellHeight + 20, height: 5)
                .rotation3DEffect(
                    .degrees(90),
                    axis: (x: 0.0, y: 0.0, z: 1.0),
                    anchor: .topLeading
                )

            HStack(spacing: 1) {
                Rectangle()
                    .foregroundStyle(.gray.quinary)
                    .frame(width: 20, height: 5)

                RoundedRectangle(cornerRadius: 18.0)
                    .foregroundStyle(.regularMaterial)
                    .frame(width: .infinity, height: cellHeight)
                    .shadow(radius: 2)
            }
        }
    }
}
