//
//  DictionaryDetailedView.swift
//  campair
//
//  Created by 박진웅 on 2022/06/15.
//

import SwiftUI

struct DictionaryDetailedView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var selectedEquipmentNumber: Int = 0

    var body: some View {
            VStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { value in
                        HStack(spacing: 0) {
                            ForEach(1..<17) { index in
                                Button {
                                    self.selectedEquipmentNumber = index
                                    value.scrollTo(index, anchor: .center)
                                } label: {
                                    Text("Item " + String(index))
                                        .foregroundColor(self.selectedEquipmentNumber == index ? Color.white : Color(#colorLiteral(red: 0.6071556211, green: 0.603967011, blue: 0.6179282665, alpha: 1)))
                                        .font(.system(.subheadline, design: .default))
                                        .font(Font.system(size: 14))
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, self.selectedEquipmentNumber == index ? 4 : 0)
                                        .background(RoundedRectangle(cornerRadius: 17.5)
                                            .foregroundColor(self.selectedEquipmentNumber == index ? Color(#colorLiteral(red: 0.3830943704, green: 0.3830943704, blue: 0.3830943704, alpha: 1)) : Color.white)
                                                     )
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                    }
                ScrollView {
                    EquipmentCategory()
                    EquipmentCategory()
                    EquipmentCategory()
                    EquipmentCategory()
                    EquipmentCategory()
                    EquipmentCategory()
                }

            }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {
                            self.mode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color.black)
                        })
                    }
                }
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
