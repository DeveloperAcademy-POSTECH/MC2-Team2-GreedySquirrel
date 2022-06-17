//
//  EquipmentDictionaryMainView.swift
//  campair
//
//  Created by 이가은 on 2022/06/12.
//

import SwiftUI

struct DictionaryMainView: View {
    @State private var searchWord = ""
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil),
        GridItem(.flexible(), spacing: 10, alignment: nil)
    ]
    var body: some View {
        NavigationView {
                ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 0) {
                        Text("Logo")
                            .padding(.trailing, 20)
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .stroke()
                                .background(Color.white)
                                .frame(height: 34)
                            HStack(spacing: 0) {
                                Image(systemName: "magnifyingglass")
                                    .padding(.horizontal, 10)
                                TextField("검색어를 입력하세요.", text: self.$searchWord)
                            }
                        }
                    }
                    Text("어서와요!(가안)\n장비를 알아보아요")
                        .bold()
                        .font(.system(size: 25))
                        .padding(.vertical, 10)
                    Text("캠핑페어 알아보쟛")
                        .font(.system(size: 20))
                    LazyVGrid(columns: self.columns) {
                        ForEach(0..<16) { _ in
                            BoxView(image: Image(systemName: "hammer"), name: "캠핑페어")
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top, 30)
                //.navigaㄴtionBarHidden(true)
            }
                .navigationTitle("SDFWER")
                //.navigationBarHidden(true)
        }
    }
}

struct BoxView: View {
    let image: Image
    let name: String
    var body: some View {
        NavigationLink(destination: DictionaryDetailedView()) {
            VStack {
                Rectangle()
                    .stroke()
                    .frame(width: 70, height: 70)
                    .overlay(
                        image
                            .font(.system(size: 30))
                    )
                Text(name)
                    .font(.system(size: 15))
            }
            .foregroundColor(Color.black)
            .padding(.bottom, 10)
        }
    }
}

struct DictionaryMainView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryMainView()
    }
}
