//
//  InterestEquipmentView.swift
//  campair
//
//  Created by 이가은 on 2022/07/12.
//

import SwiftUI

struct InterestEquipmentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("곧 떠나는 \n당신의 관심 장비")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    ForEach(0..<5) { _ in
                        RecommendedEquipmentCardView(equipment: ContentEquipment(name: "임시장비"), imageSet: .constant(["none": Data()]))
                    }
                }
                .foregroundColor(Color(hex: "4F4F4F"))
                .padding(.top, 30)
                .padding(.leading, 20)
            }
            .navigationBarHidden(true)
            .navigationTitle("")
        }
    }
}

struct InterestEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        InterestEquipmentView()
    }
}
