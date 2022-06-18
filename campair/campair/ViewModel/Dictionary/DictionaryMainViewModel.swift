//
//  DictionaryMainViewModel.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Foundation

final class DictionaryMainViewModel: ObservableObject {
    private let useCase = DictionaryUseCase(repository: DictionaryRepository())
    @Published var dictionaryMainCollection: DictionaryMainCollection = DictionaryMainCollection()
    @Published var imageSet: [String: Data] = ["none": Data()]
    func viewAppeared() {
        self.useCase.getDictionaryMainCollection(completion: { [weak self] equipmentGroupData in
            guard let self = self else { return }
            self.dictionaryMainCollection = equipmentGroupData
            for groupIndex in equipmentGroupData.dictionaryMainCategory.indices {
                // fetch 장비군
                let dictionaryGroup = equipmentGroupData.dictionaryMainCategory[groupIndex]
                self.useCase.fetchImageData(fromURLString: dictionaryGroup.paintingURL) { imageData in
                    DispatchQueue.main.async {
                        self.imageSet[dictionaryGroup.paintingName] = imageData
                    }
                }
            }
        })
    }
}
