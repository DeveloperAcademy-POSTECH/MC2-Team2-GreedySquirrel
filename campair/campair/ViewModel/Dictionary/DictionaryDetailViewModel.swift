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
    @Published var dictionaryDetailCategory: DictionaryDetailCategory?
    @Published var imageSet: [String: Data] = [:]
    func viewAppeared() {
        self.dictionaryUseCase.getDictionaryDetailCategory { [weak self] dictionaryDetailCategoryData in
            guard let self = self else { return }
            self.dictionaryDetailCategory = dictionaryDetailCategoryData
            for categoryIndex in
                    dictionaryDetailCategoryData.equipmentList.indices {
                let dictionaryCategory = dictionaryDetailCategoryData.equipmentList[categoryIndex]
                self.dictionaryUseCase.fetchImageData(fromURLString: dictionaryCategory.paintingURLString) { imageData in
                    DispatchQueue.main.async {
                        self.imageSet[dictionaryCategory.paintingName] = imageData
                    }
                }
            }
        }
    }
}
