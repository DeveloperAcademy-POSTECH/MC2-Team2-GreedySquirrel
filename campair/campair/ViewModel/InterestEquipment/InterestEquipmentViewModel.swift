//
//  InterestEquipmentViewModel.swift
//  campair
//
//  Created by 이가은 on 2022/07/13.
//
import Combine
import Foundation

final class InterestEquipmentViewModel: ObservableObject {
    /// interestEquipments - key : name , value : ImageName
    @Published var interestEquipments: [String: String] = [:]
    private let useCase = InterestEquipmentUseCase(repository: InterestEquipmentRepository())
    @Published var imageSet: [String: Data] = ["none": Data()]
    @Published var interestEquipmentContent: InterestEquipmentContent = InterestEquipmentContent()
    func viewAppeared() {
        self.interestEquipments = useCase.getUserDefault()
        for interestEquipment in interestEquipments {
            self.useCase.getInterestEquipmentContent(fileName: interestEquipment.value) {[weak self] interestEquipmentContentData in
                guard let self = self else { return }
                self.interestEquipmentContent = interestEquipmentContentData
                self.useCase.fetchImageData(fromURLString: self.interestEquipmentContent.paintingURLString) { imageData in
                    DispatchQueue.main.async {
                        self.imageSet[interestEquipment.value] = imageData
                    }
                }
            }
        }
    }
    func isHearted(equipmentName: String) -> Bool {
       return self.interestEquipments.contains(where: { $0.key == equipmentName })
    }
    func clickedHeart(isHearted: Bool, equipmentName: String, equipmentPaintingImageName: String) {
        if isHearted {
            self.interestEquipments = useCase.removeEquipment(equipmentName: equipmentName)
        } else {
            self.interestEquipments = useCase.addEquipment(equipmentName: equipmentName, equipmentPaintingImageName: equipmentPaintingImageName)
        }
    }
}
