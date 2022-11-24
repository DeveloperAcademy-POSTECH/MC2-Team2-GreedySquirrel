//
//  DictionaryDetailedView.swift
//  campair
//
//  Created by 박진웅 on 2022/06/15.
//

import SwiftUI

private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct DictionaryDetailedView: View {
    @State var scrollOffset: CGFloat = .zero
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var selectedEquipmentNumber: Int = 0
    @State var verticalScrollIndex: Int = 0
    @StateObject var viewModel = DictionaryDetailedViewModel()

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .ignoresSafeArea()
                    .frame(height: 0)
                    .foregroundColor(Color(hex: "FEFCFB"))
                HStack {
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.black)
                    })
                    Spacer()
                    Text(viewModel.dictionaryPreDetailCategory.dictionaryDetailCategory[selectedEquipmentNumber].name)
                    Spacer()
                    Text("")
                        .frame(width: 40, height: 40)
                }
                .padding(.horizontal, 8)
                .background(Color(hex: "FEFCFB"))
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        HStack(spacing: 0) {
                            ForEach(viewModel.dictionaryPreDetailCategory.dictionaryDetailCategory.indices, id: \.self) { index in
                                Button {
                                    selectedEquipmentNumber = index
                                    verticalScrollIndex = index
                                } label: {
                                    Text(viewModel.dictionaryPreDetailCategory.dictionaryDetailCategory[index].name)
                                        .foregroundColor(self.selectedEquipmentNumber == index ? Color.white : Color(#colorLiteral(red: 0.6071556211, green: 0.603967011, blue: 0.6179282665, alpha: 1)))
                                        .font(.system(.subheadline, design: .default))
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, self.selectedEquipmentNumber == index ? 4 : 0)
                                        .background(RoundedRectangle(cornerRadius: 17.5)
                                            .foregroundColor(self.selectedEquipmentNumber == index ? Color(#colorLiteral(red: 0.3830943704, green: 0.3830943704, blue: 0.3830943704, alpha: 1)) : Color(hex: "FEFCFB"))
                                        )
                                }
                            }
                            .onAppear {
                                withAnimation(.spring()) {
                                    proxy.scrollTo(selectedEquipmentNumber, anchor: .top)
                                }
                            }
                            .onChange(of: selectedEquipmentNumber, perform: { value in
                                withAnimation(.spring()) {
                                    proxy.scrollTo(value, anchor: .center)
                                }
                                selectedEquipmentNumber = value
                            })
                            .onChange(of: scrollOffset, perform: { _ in
                                withAnimation(.spring()) {
                                    if scrollOffset > -425 {
                                        selectedEquipmentNumber = 0
                                    } else if scrollOffset > -1559 {
                                        selectedEquipmentNumber = 1
                                    } else if scrollOffset > -1914 {
                                        selectedEquipmentNumber = 2
                                    } else if scrollOffset > -2557 {
                                        selectedEquipmentNumber = 3
                                    } else if scrollOffset > -2980 {
                                        selectedEquipmentNumber = 4
                                    } else if scrollOffset > -3925 {
                                        selectedEquipmentNumber = 5
                                    } else if scrollOffset > -4357 {
                                        selectedEquipmentNumber = 6
                                    } else if scrollOffset > -4610 {
                                        selectedEquipmentNumber = 7
                                    } else if scrollOffset > -5142 {
                                        selectedEquipmentNumber = 8
                                    } else if scrollOffset > -5987 {
                                        selectedEquipmentNumber = 9
                                    } else if scrollOffset > -6426 {
                                        selectedEquipmentNumber = 10
                                    } else if scrollOffset > -7062 {
                                        selectedEquipmentNumber = 11
                                    } else if scrollOffset > -7385 {
                                        selectedEquipmentNumber = 12
                                    } else if scrollOffset > -8028 {
                                        selectedEquipmentNumber = 13
                                    } else if scrollOffset > -8674 {
                                        selectedEquipmentNumber = 14
                                    } else {
                                        selectedEquipmentNumber = 15
                                    }
                                }
                            })
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 19)
                .padding(.top, 30)
                .background(Color(hex: "FEFCFB"))
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(hex: "E8E8E8"))
                ScrollViewOffset(color: "FFFFFF") {
                    ScrollViewReader { proxy in
                        ForEach(viewModel.dictionaryPreDetailCategory.dictionaryDetailCategory.indices, id: \.self) { preindex in
                            VStack {
                                Text(viewModel.dictionaryPreDetailCategory.dictionaryDetailCategory[preindex].name)
                                    .font(.system(.title))
                                    .fontWeight(.bold)
                                    .frame(maxWidth: 350, alignment: .leading)
                                    .padding(.bottom, 14)
                                    .padding(.top, 41)
                                ForEach(viewModel.dictionaryPreDetailCategory.dictionaryDetailCategory[preindex].equipmentList.indices, id: \.self) { index in
                                    let temp = self.viewModel.dictionaryPreDetailCategory.dictionaryDetailCategory[preindex].equipmentList
                                    NavigationLink(
                                        destination: DictionaryContentView(jsonFileName: temp.sorted(by: { $0.paintingName < $1.paintingName })[index].paintingName),
                                        label: {
                                        EquipmentBox(imageSet: self.$viewModel.imageSet, imageName: temp.sorted(by: { $0.paintingName < $1.paintingName })[index].paintingName, equipmentName: temp.sorted(by: { $0.name < $1.name })[index].name)
                                    })
                                    .padding(.bottom, index != viewModel.dictionaryPreDetailCategory.dictionaryDetailCategory[preindex].equipmentList.count-1 ? 6 : 40)
                                }
                                Rectangle()
                                    .frame(height: 8)
                                    .foregroundColor(Color(hex: "FEFCFB"))
                            }
                        }
                        .onAppear {
                            withAnimation(.spring()) {
                                if scrollOffset == 0 {
                                    proxy.scrollTo(selectedEquipmentNumber, anchor: .top)
                                }
                            }
                        }
                        .onChange(of: verticalScrollIndex, perform: { value in
                            withAnimation(.spring()) {
                                proxy.scrollTo(value, anchor: .top)
                            }
                        })
                    }
                } onOffsetChange: {
                    scrollOffset = $0
                }
                .padding(.top, 8)
            }
        }
        .navigationBarHidden(true)
    }
}

struct DictionaryDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DictionaryDetailedView()
        }
    }
}

struct EquipmentBox: View {
    @Binding var imageSet: [String: Data]
    let imageName: String
    let equipmentName: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(#colorLiteral(red: 0.9688159823, green: 0.9688159823, blue: 0.9688159823, alpha: 1)), lineWidth: 1)
                .frame(width: 350, height: 84)
            HStack(spacing: 0) {
                if let uiImage = UIImage(data: imageSet[self.imageName] ?? imageSet["none"]!) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 66, height: 66)
                        .padding(.leading, 30)
                }
                Text(self.equipmentName)
                    .font(.system(.headline, design: .default))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 0.3830943704, green: 0.3830943704, blue: 0.3830943704, alpha: 1)))
                    .font(Font.system(size: 17))
                    .padding(.leading, 10)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(#colorLiteral(red: 0.8209876418, green: 0.821508944, blue: 0.8374733329, alpha: 1)))
                    .frame(width: 34, height: 34)
                    .padding(.trailing, 34)
            }
        }
    }
}
