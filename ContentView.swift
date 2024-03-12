//
//  ContentView.swift
//  Timeline
//
//  Created by Dmytro Honcharenko on 12.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isSheetPresenting = false

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
            }
            .navigationTitle("Timeline")
            .scrollIndicators(.never)
            .sheet(isPresented: $isSheetPresenting) {
                // TODO: Implement logic
                Spacer()
                Button(action: {
                    isSheetPresenting = false
                }) {
                    Text("Done")
                        .padding()
                        .foregroundStyle(.pink)
                        .frame(maxWidth: .infinity)
                        .background(.white.secondary)
                        .overlay {
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(style: .init(lineWidth: 1, dash: [10])
                                )
                                .foregroundStyle(.pink)
                        }
                        .clipShape(.rect(cornerRadius: 18))
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                }
                .presentationDetents([.medium])
                .presentationBackground(alignment: .center) {
                    RoundedRectangle(cornerRadius: 36)
                        .foregroundStyle(.white)
                        .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { isSheetPresenting = true }) {
                        Image(systemName: "plus")
                            .tint(.pink)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

// TODO: Separate into simpler view
struct TimelineCellView: View {
    let cellHeight: CGFloat = 200

    var body: some View {
        VStack(alignment: .leading) {
            // Decoration
            Rectangle()
                .foregroundStyle(.gray.quinary)
                .frame(width: cellHeight + 20, height: 5)
                .rotation3DEffect(
                    .degrees(90),
                    axis: (x: 0.0, y: 0.0, z: 1.0),
                    anchor: .topLeading
                )

            HStack(spacing: 1) {
                // Decoration
                Rectangle()
                    .foregroundStyle(.gray.quinary)
                    .frame(width: 20, height: 5)

                // Cell
                RoundedRectangle(cornerRadius: 18.0)
                    .foregroundStyle(.regularMaterial)
                    .frame(width: .infinity, height: cellHeight)
                    .shadow(radius: 2)
                    .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 18.0))
                    .contextMenu(ContextMenu(menuItems: {
                        Text("Edit...")
                        Text("Delete")
                    }))
            }
        }
    }
}
