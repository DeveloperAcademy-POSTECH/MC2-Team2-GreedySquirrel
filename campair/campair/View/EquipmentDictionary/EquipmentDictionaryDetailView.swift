//
//  EquipmentDictionarySubView.swift
//  campair
//
//  Created by 이가은 on 2022/06/12.
//

import SwiftUI

struct EquipmentDictionaryDetailView: View {
    @State var selectedEquipmentNumber: Int = 0
    var body: some View {
        VStack(alignment: .leading) {
            SelectingEquipmentDictionaryView(selectedEquipmentNumber: self.$selectedEquipmentNumber)
            ScrollView(showsIndicators: false) {
                ForEach(0..<6) { _ in
                    SelectingEquipmentView()
                }
            }
        }
        .padding(.horizontal, 25)
        .navigationTitle("캠핑페어")
    }
}

struct SelectingEquipmentDictionaryView: View {
    @Binding var selectedEquipmentNumber: Int
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(0..<16) { index in
                        Button {
                            self.selectedEquipmentNumber = index
                        } label: {
                            if self.selectedEquipmentNumber == index {
                                VStack {
                                    Text("장비군")
                                        .font(.system(size: 18))
                                        .padding(.horizontal, 10)
                                    Rectangle().frame(height: 2)
                                }
                                .foregroundColor(Color.orange)
                            } else {
                                Text("장비군")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal, 10)
                            }
                        }
                    }
                }
            }
            Divider()
        }
        .padding(.bottom, 20)
    }
}

struct SelectingEquipmentView: View {
    var body: some View {
        Button {
            // TODO: Add Handling
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 30) {
                    Rectangle()
                        .stroke()
                        .frame(width: 70, height: 70)
                        .overlay(
                            Image(systemName: "hammer")
                                .font(.system(size: 30))
                        )
                    VStack(spacing: 10) {
                        Text("이너매트(장비이름)")
                            .font(.system(size: 24))
                        Text("장비군이름")
                            .font(.system(size: 18))
                    }
                }
                Divider()
                    .padding(.vertical, 20)
            }
        }
        .foregroundColor(Color.black)
    }
}

struct EquipmentDictionaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentDictionaryDetailView()
    }
}
