//
//  ContentView.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = EditorDetailViewModel2()
    var body: some View {
        VStack {
            Text(viewModel.titleText)
                .padding()
            // testcode
            Button("test") {
                viewModel.testButtonTouched()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
