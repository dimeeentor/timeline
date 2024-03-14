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
                List(0 ..< 7) { _ in
                    NavigationLink(destination: { Text("asd") }) {
                        Text(Int.random(in: 1...100), format: .number)
                    }
                    .listRowBackground(Color.brown.opacity(0.1))
                }
                .scrollContentBackground(.hidden)
                .listRowSpacing(20)
                .background(.brown.opacity(0.2))
            }
            .navigationTitle("Timeline")
            .scrollIndicators(.never)
            .sheet(isPresented: $isSheetPresenting) {
                // TODO: Implement logic
                SheetView(isSheetPresenting: $isSheetPresenting)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { isSheetPresenting = true }) {
                        Image(systemName: "plus")
                            .tint(.pink)
                    }
                }
            }
            .toolbarBackground(.brown.opacity(0.2), for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}

// TODO: Separate into simpler view
enum CellHeight: CGFloat, Hashable, CaseIterable {
    case Big = 200
    case Medium = 140
    case Small = 100
}

struct TimelineCellView: View {
    @State private var cellHeight: CellHeight = .Big

    var body: some View {
        VStack(alignment: .leading) {
            // Decoration
//            Rectangle()
//                .foregroundStyle(.gray.quinary)
//                .frame(width: cellHeight.rawValue + 20, height: 5)
//                .rotation3DEffect(
//                    .degrees(90),
//                    axis: (x: 0.0, y: 0.0, z: 1.0),
//                    anchor: .topLeading
//                )

            HStack(spacing: 1) {
                // Decoration
//                Rectangle()
//                    .foregroundStyle(.gray.quinary)
//                    .frame(width: 20, height: 5)

                // Cell
                RoundedRectangle(cornerRadius: 18.0)
                    .foregroundStyle(.white)
                    .frame(width: .infinity, height: cellHeight.rawValue)
                    .overlay {
                        RoundedRectangle(cornerRadius: 18.0)
                            .stroke(lineWidth: 0.5)
                            .foregroundStyle(.black.secondary)
                    }
                    .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: 18.0))
                    .contextMenu(ContextMenu(menuItems: {
                        Text("Edit...")
                        Text("Delete")
                        Picker("Change size", selection: $cellHeight) {
                            ForEach(CellHeight.allCases, id: \.self) { size in
                                Text("\(size)")
                            }
                        }
                        .pickerStyle(.menu)
                    }))
            }
        }
        .animation(.default, value: cellHeight)
    }
}

struct SheetView: View {
    @Binding var isSheetPresenting: Bool
    @State private var text = ""

    var body: some View {
        // TODO: TextField to add new event
        VStack(spacing: 5) {
            TextEditor(text: $text)
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .scrollContentBackground(.hidden)
                .background(.gray.quinary.opacity(0.85))
                .clipShape(.rect(cornerRadius: 9))

            Spacer()

            Button(action: {
                isSheetPresenting = false
            }) {
                Text("Done")
                    .padding()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(.pink)
                    .clipShape(.rect(cornerRadius: 18))
            }
            .presentationDetents([.medium, .large])
            .presentationCornerRadius(18)
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
}
