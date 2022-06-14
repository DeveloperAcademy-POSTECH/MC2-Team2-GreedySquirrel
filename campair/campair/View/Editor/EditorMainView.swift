//
//  EditorMainView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/13.
//

import SwiftUI

struct EditorMainView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("캠프페어와")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("새 여행을 준비해요")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 45)
                    .padding(.leading, 20)
                    VStack(spacing: 50) {
                        ForEach(0..<3) { _ in
                            VStack(spacing: 10) {
                                EditorCardView()
                                EditorEquipListView()
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct EditorMainView_Previews: PreviewProvider {
    static var previews: some View {
        EditorMainView()
        EditorMainView()
            .previewDevice("iPod touch (7th generation)")
    }
}
