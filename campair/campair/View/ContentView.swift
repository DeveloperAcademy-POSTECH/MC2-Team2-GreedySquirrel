//
//  ContentView.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = EditorDetailViewModel()
    var body: some View {
        VStack {
            Text("Fighting squerrels!")
                .padding()
            // testcode
            Button {
                viewModel.viewAppeared()
            } label: {
                Text(viewModel.editorDetailContent.openingSection.cardPaintingTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
