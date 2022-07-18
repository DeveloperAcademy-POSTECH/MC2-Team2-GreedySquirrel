//
//  InterestEquipmentView.swift
//  campair
//
//  Created by 이가은 on 2022/07/12.
//

import SwiftUI

struct InterestEquipmentView: View {
    @EnvironmentObject var viewModel: InterestEquipmentViewModel
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Text("곧 떠나는 \n당신의 관심 장비")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "4F4F4F"))
                }
                .padding(.horizontal, 20)
                if viewModel.interestEquipments.isEmpty {
                    Spacer()
                    VStack(spacing: 0) {
                        Image(uiImage: UIImage(named: "squirrel")!)
                        Text("텅 비어있습니다")
                            .frame(maxWidth: .infinity)
                            .padding(.top, 25)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                } else {
                    let sortedArray = viewModel.interestEquipments.sorted { $0.0 < $1.0 }
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(sortedArray.indices, id: \.self) { index in
                                RecommendedEquipmentCardView(equipment: ContentEquipment(name: sortedArray[index].key, paintingImageName: sortedArray[index].value), imageSet: $viewModel.imageSet)
                                    .padding(.bottom, 6 )
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .foregroundColor(Color(hex: "4F4F4F"))
                }
                Spacer()
            }
            .onAppear {
                viewModel.interestEquipments = (UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]())
            }
            .padding(.top, 30)
            .navigationBarHidden(true)
            .navigationTitle("")
        }
    }
}

struct InterestEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        InterestEquipmentView()
            .environmentObject(InterestEquipmentViewModel())
    }
}
