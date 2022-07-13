//
//  DictionaryDetailViewModel.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Combine
import Foundation

final class DictionaryDetailedViewModel: ObservableObject {
    private let dictionaryUseCase = DictionaryUseCase(repository: DictionaryRepository())
    @Published var dictionaryPreDetailCategory: DictionaryPreDetailCategory
    @Published var imageSet: [String: Data] = ["none": Data()]
    init(dictionaryPreDetailCategory: DictionaryPreDetailCategory = DictionaryPreDetailCategory()) {
        self.dictionaryPreDetailCategory = dictionaryPreDetailCategory
    }
    func viewAppeared() {
        self.dictionaryUseCase.getDictionaryDetailCategory { [weak self] dictionaryPreDetailCategoryData in
            guard let self = self else { return }
            self.dictionaryPreDetailCategory = dictionaryPreDetailCategoryData
            for preCategoryIndex in dictionaryPreDetailCategoryData.dictionaryDetailCategory.indices {
                let dictionaryDetailCategory = dictionaryPreDetailCategoryData.dictionaryDetailCategory[preCategoryIndex]
                for categoryIndex in
                        dictionaryDetailCategory.equipmentList.indices {
                    let dictionaryCategory = dictionaryDetailCategory.equipmentList[categoryIndex]
                    self.dictionaryUseCase.fetchImageData(fromURLString: dictionaryCategory.paintingURLString) { imageData in
                        DispatchQueue.main.async {
                            self.imageSet[dictionaryCategory.paintingName] = imageData
                        }
                    }
                }
            }
        }
    }
}
