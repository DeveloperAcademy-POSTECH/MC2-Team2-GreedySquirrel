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
    @Published var interestEquipments: [String: String] = [:] {
        didSet {
            viewAppeared()
        }
    }
    private let useCase = InterestEquipmentUseCase(repository: InterestEquipmentRepository())
    @Published var imageSet: [String: Data] = ["none": Data()]
    @Published var interestEquipmentContent: InterestEquipmentContent = InterestEquipmentContent()
    func viewAppeared() {
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
    func removeEquipment(equipmentName: String) {
        var interestEquipments = UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]()
        interestEquipments[equipmentName] = nil
        UserDefaults.standard.set(interestEquipments, forKey: "interestEquipments")
        self.interestEquipments = UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]()
    }
    func addEquipment(equipmentName: String, equipmentPaintingImageName: String) {
        var interestEquipments = UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]()
        interestEquipments[equipmentName] = equipmentPaintingImageName
        UserDefaults.standard.set(interestEquipments, forKey: "interestEquipments")
        self.interestEquipments = UserDefaults.standard.object(forKey: "interestEquipments") as? [String: String] ?? [String: String]()
    }
}
