//
//  ContentView.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = DictionaryMainViewModel()
    var body: some View {
        ScrollView {
            // testcode
            ForEach(viewModel.dictionaryMainCollection.dictionaryMainCategory.indices, id: \.self) { index in
                let equipment = viewModel.dictionaryMainCollection.dictionaryMainCategory[index]
                let imageName = equipment.paintingName
                Text(imageName)
                    .padding()
                LxtractedView(imageSet: $viewModel.imageSet, imageName: imageName)
            }
        }
        .onAppear {
            // testcode
            viewModel.viewAppeared()
        }
    }
}

struct LxtractedView: View {
    @Binding var imageSet: [String: Data]
    let imageName: String
    var body: some View {
        if let uiImage = UIImage(data: imageSet[imageName] ?? imageSet["none"]! ) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 300)
        } else {
           Text("Image loading ...")
                .frame(width: 350, height: 300)
                .foregroundColor(.customBlack)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
