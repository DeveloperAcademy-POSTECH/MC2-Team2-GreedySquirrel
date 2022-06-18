//
//  DictionaryContentView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Combine
import Foundation

final class DictionaryContentViewModel: ObservableObject {
    private let dictionaryUseCase = DictionaryUseCase(repository: DictionaryRepository())
    @Published var dictionaryEquipmentContent: DictionaryEquipmentContent = DictionaryEquipmentContent()
    @Published var imageSet: [String: Data] = ["none": Data()]
    func viewAppeared(fileName: String) {
        self.dictionaryUseCase.getDictionaryEquipmentContent(fileName: fileName) {[weak self] dictionaryEquipmentContentData in
            guard let self = self else { return }
            self.dictionaryEquipmentContent = dictionaryEquipmentContentData
            self.dictionaryUseCase.fetchImageData(fromURLString: self.dictionaryEquipmentContent.paintingURLString) { imageData in
                DispatchQueue.main.async {
                    self.imageSet[self.dictionaryEquipmentContent.name] = imageData
                }
            }
        }
    }
}
