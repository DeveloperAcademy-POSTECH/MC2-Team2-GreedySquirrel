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
    @State var scrollIndex: Int = 1
    @ObservedObject var viewModel = DictionaryDetailedViewModel()

    var body: some View {
            VStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        HStack(spacing: 0) {
                            ForEach(1...10, id: \.self) { index in
                                Button {
                                    selectedEquipmentNumber = index
                                    scrollIndex = index
                                } label: {
                                    Text("Item " + String(index))
                                        .foregroundColor(self.selectedEquipmentNumber == index ? Color.white : Color(#colorLiteral(red: 0.6071556211, green: 0.603967011, blue: 0.6179282665, alpha: 1)))
                                        .font(.system(.subheadline, design: .default))
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, self.selectedEquipmentNumber == index ? 4 : 0)
                                        .background(RoundedRectangle(cornerRadius: 17.5)
                                            .foregroundColor(self.selectedEquipmentNumber == index ? Color(#colorLiteral(red: 0.3830943704, green: 0.3830943704, blue: 0.3830943704, alpha: 1)) : Color.white)
                                                     )
                                    }
                                }
                                .onChange(of: scrollIndex, perform: { value in
                                    withAnimation(.spring()) {
                                        proxy.scrollTo(value, anchor: .center)
                                    }
                                })
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                    }

                ScrollView {
                    ScrollViewReader { proxy in
                        ForEach(1...10, id: \.self) { index in
                            EquipmentCategory()
                        }
                        .onChange(of: scrollIndex, perform: { value in
                            withAnimation(.spring()) {
                                proxy.scrollTo(value, anchor: .top)
                            }
                        })
                    }
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

struct EquipmentBox: View {
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
            ForEach(1..<6) { index in
                NavigationLink(destination: DictionaryContentView(fileName: "경량_의자")
                    .navigationBarTitle("텐트", displayMode: .inline)
                ) {
                    EquipmentBox()
                }
                .padding(.bottom, index != 5 ? 6 : 40)
            }

            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.9970478415, green: 0.9906973243, blue: 0.9875426888, alpha: 1)))
                .frame(width: .infinity, height: 20)
        }
    }
}
