//
//  EditorDetailViewModel.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/17.
//

import Foundation

final class EditorDetailViewModel2: ObservableObject {
    private let editorUseCase = EditorUseCase(repository: EditorRepository())
    @Published var titleText = "test"
    func testButtonTouched() {
        self.editorUseCase.getEditorDetailContent { [weak self] editorDetailContents in
            print(editorDetailContents)
            // test code
            guard let self = self else { return }
            print(editorDetailContents.version)
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


//final class EditorDetailViewModel: ObservableObject {
//    private let editorUseCase = EditorUseCase(repository: EditorRepository())
//    @Published var editorDetailContent: EditorDetailContent = EditorDetailContent()
//    @Published var imageSet: [String: Data] = [:]
//    func viewAppeared() {
//        self.editorUseCase.getEditorDetailContent { [weak self] editorDetailContent in
//            guard let self = self else { return }
//            self.editorDetailContent = editorDetailContent
//            for contentsIndex in editorDetailContent.equipmentContents.indices {
////                // fetch editorDetailContent's image
////                let editorMainContent = editorDetailContent.equipmentContents[contentsIndex]
////                self.editorUseCase.fetchImageData(fromURLString: editorMainContent.cardPaintingURLString) { imageData in
////                    DispatchQueue.main.async {
////                        self.imageSet[editorMainContent.cardPaintingTitle] = imageData
////                    }
////                }
////                // fetch ContentEquipment's image
////                for equipmentIndex in editorMainContent.contentEquipments.indices {
////                    let contentEquipment = editorMainContent.contentEquipments[equipmentIndex]
////                    self.editorUseCase.fetchImageData(fromURLString: contentEquipment.paintingURLString) { imageData in
////                        DispatchQueue.main.async {
////                            self.imageSet[contentEquipment.name] = imageData
////                        }
////                    }
////                }
//            }
//        }
//    }
//}
//
