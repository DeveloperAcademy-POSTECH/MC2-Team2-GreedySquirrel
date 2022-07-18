//
//  RecommendedEquipmentCardView.swift
//  campair
//
//  Created by 이가은 on 2022/06/15.
//

import SwiftUI

struct RecommendedEquipmentCardView: View {
    let equipment: ContentEquipment
    @Binding var imageSet: [String: Data]
    @EnvironmentObject var viewModel: InterestEquipmentViewModel
    init(equipment: ContentEquipment, imageSet: Binding<[String: Data]>) {
        self.equipment = equipment
        self._imageSet = imageSet
    }
    var body: some View {
        NavigationLink {
            DictionaryContentView(jsonFileName: equipment.paintingImageName)
        } label: {
            HStack(spacing: 0) {
                if let uiImage = UIImage(data: imageSet[equipment.paintingImageName] ?? imageSet["none"]! ) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 66, height: 66)
                        .padding(.horizontal, 10)
                } else {
                        ProgressView()
                        .font(.system(.footnote))
                        .frame(width: 66, height: 66)
                        .foregroundColor(.customBlack)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(self.equipment.name)")
                        .headlineDefaultBlack()
                        .padding(.bottom, 4)
                        .padding(.top, 22)
                    Text("장비사전 읽어보기")
                        .caption1DefaultDarkGray()
                        .padding(.bottom, 22)
                }
                Spacer()
                Button {
                    self.heartButtonClicked()
                } label: {
                    Image(systemName: viewModel.isHearted(equipmentName: equipment.name) ? "heart.fill" : "heart")
                        .font(.system(size: 18))
                        .frame(width: 34, height: 34)
                        .foregroundColor(Color.customDarkGray)
                        .padding(.trailing, 14)
                }
            }
            .navigationTitle("")
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color.customLightGray)
            )
        }
    }
    func heartButtonClicked() {
        let isHearted = viewModel.isHearted(equipmentName: equipment.name)
        if isHearted {
            viewModel.removeEquipment(equipmentName: equipment.name)
        } else {
            viewModel.addEquipment(equipmentName: equipment.name, equipmentPaintingImageName: equipment.paintingImageName)
        }
    }
}

struct RecommendedEquipmentCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedEquipmentCardView(equipment: ContentEquipment(), imageSet: .constant(["none": Data()]))
    }
}
