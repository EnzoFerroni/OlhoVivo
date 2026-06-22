//
//  SheetView.swift
//  OlhoVivo
//
//  Created by Enzo Ferroni on 22/06/26.
//

import SwiftUI

/// Bottom sheet that hosts line search and the selected line's details.
///
/// It shows one of three states: an empty placeholder, a list of search
/// results, or the details of the currently selected line.
struct SheetView: View {
    @ObservedObject var viewModel: MapViewModel

    @State private var lineToConfirm: BusLine?

    var body: some View {
        VStack(spacing: 16) {
            searchField

            if let line = viewModel.selectedLine {
                lineDetails(for: line)
            }
            else if !viewModel.searchResults.isEmpty {
                searchResults
            }
            else {
                EmptyLineState()
            }

            Spacer(minLength: 0)
        }
        .padding()
        .interactiveDismissDisabled()
        .presentationDetents([.height(200), .large])
        .presentationBackground(.regularMaterial)
        .presentationBackgroundInteraction(.enabled(upThrough: .large))
        .task(id: viewModel.searchText) {
            try? await Task.sleep(for: .milliseconds(300))
            await viewModel.search()
        }
        .alert("Deseja selecionar essa linha?",
               isPresented: confirmBinding,
               presenting: lineToConfirm) { line in
            Button("Não", role: .cancel) {}
            Button("Sim") {
                Task { await viewModel.select(line) }
            }
        } message: { _ in
            Text("Ao selecioná-la, você verá a posição dos pontos e os ônibus em operação no mapa.")
        }
    }

    private var searchField: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Pesquisar", text: $viewModel.searchText)
                .autocorrectionDisabled()
        }
        .modifier(TextFieldGrayBackgroundColor())
    }

    private var searchResults: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.searchResults) { line in
                    Button {
                        lineToConfirm = line
                    } label: {
                        LineCard(line: line)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private func lineDetails(for line: BusLine) -> some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                LineCard(line: line, stopCount: viewModel.stops.count)

                Text("\(viewModel.vehicles.count) veículos operando na linha")
                    .font(Font.custom("SF Pro", size: 14))
                    .foregroundColor(Color.foregroundPrimary)

                ForEach(viewModel.stops) { stop in
                    StopIdentifier(name: stop.name, address: stop.address)
                }
            }
        }
    }

    private var confirmBinding: Binding<Bool> {
        Binding(
            get: { lineToConfirm != nil },
            set: { if !$0 { lineToConfirm = nil } }
        )
    }
}

/// Rounded grey background used by the sheet's search field.
struct TextFieldGrayBackgroundColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.gray.opacity(0.1))
            .cornerRadius(8)
            .foregroundColor(.primary)
    }
}

#Preview {
    SheetView(viewModel: MapViewModel())
}
