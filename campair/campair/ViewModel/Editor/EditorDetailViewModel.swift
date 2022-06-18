//
//  EditorDetailViewModel.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Foundation

final class EditorDetailViewModel: ObservableObject {
    private let useCase = EditorUseCase(repository: EditorRepository())
    @Published var editorDetailContent: EditorDetailContent
    @Published var imageSet: [String: Data] = ["none": Data()]
    init(editorDetailContent: EditorDetailContent = EditorDetailContent()) {
        self.editorDetailContent = editorDetailContent
    }
    func viewAppeared() {
        self.useCase.getEditorDetailContent(completion: { [weak self] editorContentData in
            guard let self = self else { return }
            self.editorDetailContent = editorContentData
            // fetch cardPainting's Image
            let openingSection = editorContentData.openingSection
            self.useCase.fetchImageData(fromURLString: openingSection.cardPaintingURLString) { imageData in
                DispatchQueue.main.async {
                    self.imageSet[openingSection.cardPaintingImageName] = imageData
                }
            }
            // fetch ContentEquipment's image
            for equipmentContentindex in editorContentData.equipmentContents.indices {
                let recommendedEquipments = editorContentData.equipmentContents[equipmentContentindex].recommendedEquipments
                for recommendedEquipmentindex in recommendedEquipments.indices {
                    let contentEquipment = recommendedEquipments[recommendedEquipmentindex]
                    self.useCase.fetchImageData(fromURLString: contentEquipment.paintingURLString) { imageData in
                        DispatchQueue.main.async {
                            self.imageSet[contentEquipment.paintingImageName] = imageData
                        }
                    }
                }
            }
        })
    }
}
