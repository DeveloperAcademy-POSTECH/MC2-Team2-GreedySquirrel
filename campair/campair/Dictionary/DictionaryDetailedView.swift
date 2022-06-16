//
//  DictionaryDetailedView.swift
//  campair
//
//  Created by 박진웅 on 2022/06/15.
//

import SwiftUI

extension String {
   func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

let width = "SomeString".widthOfString(usingFont: UIFont.systemFont(ofSize: 14, weight: .bold))

struct DictionaryDetailedView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var selectedEquipmentNumber: Int = 0

    var body: some View {
            VStack(spacing: 0) {
//                GeometryReader { geometry in
//                    Text("\(width)")
//                        .frame(
//                            width: geometry.size.width,
//                            height: geometry.size.height
//                        ).background(Color.red)
//                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(1..<17) { index in
                            Button {
                                self.selectedEquipmentNumber = index
                            } label: {
                                if self.selectedEquipmentNumber == index {
                                    Text("Item " + String(index))
                                        .foregroundColor(Color.white)
                                        .font(.system(.subheadline, design: .default))
                                        .font(Font.system(size: 14))
                                        .frame(width: ("Item " + String(index)).widthOfString(usingFont: UIFont.systemFont(ofSize: 14, weight: .bold)) + 28, height: 34)
                                        .background(Color(#colorLiteral(red: 0.3830943704, green: 0.3830943704, blue: 0.3830943704, alpha: 1)))
                                        .cornerRadius(17.5)
                                        .padding(.horizontal, 1)
//                                        .overlay(
//                                            RoundedRectangle(cornerRadius: 17.5)
//                                                .foregroundColor(Color(#colorLiteral(red: 0.3014614582, green: 0.3024801612, blue: 0.332264483, alpha: 0.6)))
//                                        )
                                } else {
                                    Text("Item " + String(index))
                                        .foregroundColor(Color(#colorLiteral(red: 0.6071556211, green: 0.603967011, blue: 0.6179282665, alpha: 1)))
                                        .font(.system(.subheadline, design: .default))
                                        .font(Font.system(size: 14))
                                        .padding(.horizontal, 15)
                                        // .frame(width: 50, height: 50)
                                        // .background(Color.red)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }

                ScrollView {
                    EquipmentCategory()
                    EquipmentCategory()
                    EquipmentCategory()
                }

            }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                                self.mode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color.black)
                            })
    }
}

struct DictionaryDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DictionaryDetailedView()
        }
    }
}

struct ExtractedView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(#colorLiteral(red: 0.9688159823, green: 0.9688159823, blue: 0.9688159823, alpha: 1)), lineWidth: 1)
            // .stroke(Color.black, lineWidth: 1)
                .frame(width: 350, height: 84)

            HStack(spacing: 0) {
                Image("paint_21")
                    .resizable()
                    .frame(width: 66, height: 66)
                    .padding(.leading, 30)
                Text("인디언 텐트")
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

struct EquipmentCategory: View {
    var body: some View {
        VStack {
            Text("텐트")
                .font(.system(.title))
                .font(.system(size: 28))
                .fontWeight(.bold)
                .frame(maxWidth: 350, alignment: .leading)
                .padding(.bottom, 14)
                .padding(.top, 41)

            NavigationLink(destination: EditorMainView()) {
                ExtractedView()
            }
            .padding(.bottom, 6)

            NavigationLink(destination: EditorMainView()) {
                ExtractedView()
            }
            .padding(.bottom, 6)

            NavigationLink(destination: EditorMainView()) {
                ExtractedView()
            }
            .padding(.bottom, 6)

            NavigationLink(destination: EditorMainView()) {
                ExtractedView()
            }
            .padding(.bottom, 6)

            NavigationLink(destination: EditorMainView()) {
                ExtractedView()
            }
            .padding(.bottom, 40)

            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.9970478415, green: 0.9906973243, blue: 0.9875426888, alpha: 1)))
                .frame(width: .infinity, height: 20)
        }
    }
}
