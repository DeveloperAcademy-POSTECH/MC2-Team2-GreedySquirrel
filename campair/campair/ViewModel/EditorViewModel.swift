//
//  EditorViewModel.swift
//  campair
//
//  Created by Shin Jae Ung on 2022/06/10.
//

import Combine
import Foundation

final class EditorMainViewModel: ObservableObject {
    private let editorUseCase = EditorUseCase(repository: EditorRepository())
    @Published var editorMainCollection: EditorMainCollection?
    @Published var imageSet: [String: Data] = [:]
    func viewAppeared() {
        self.editorUseCase.getEditorCollection { [weak self] editorCollectionData in
            guard let self = self else { return }
            self.editorMainCollection = editorCollectionData
            for contentsIndex in editorCollectionData.editorMainContents.indices {
                // fetch EditorMainContent's image
                let editorMainContent = editorCollectionData.editorMainContents[contentsIndex]
                self.editorUseCase.fetchImageData(fromURLString: editorMainContent.cardPaintingURLString) { imageData in
                    DispatchQueue.main.async {
                        self.imageSet[editorMainContent.cardPaintingTitle] = imageData
                    }
                }
                // fetch ContentEquipment's image
                for equipmentIndex in editorMainContent.contentEquipments.indices {
                    let contentEquipment = editorMainContent.contentEquipments[equipmentIndex]
                    self.editorUseCase.fetchImageData(fromURLString: contentEquipment.paintingURLString) { imageData in
                        DispatchQueue.main.async {
                            self.imageSet[contentEquipment.name] = imageData
                        }
                    }
                }
            }
        }
    }
}

final class EditorDetailViewModel2: ObservableObject {
    private let editorUseCase = EditorUseCase(repository: EditorRepository())
    @Published var titleText = "test"
    func testButtonTouched() {
        self.editorUseCase.getEditorDetailContent { [weak self] editorDetailContents in
            print(editorDetailContents)
            // test code
            guard let self = self else { return }
            self.titleText = editorDetailContents.equipmentContents[0].recommendedEquipments[0].paintingURLString
        }
    }
}

final class EditorDetailViewModel: ObservableObject {
    @Published var content: EditorDetailContent
    init(editorDetailContent: EditorDetailContent) {
        self.content = editorDetailContent
    }
}
