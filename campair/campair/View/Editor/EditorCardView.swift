//
//  EditorCardView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/14.
//

import SwiftUI

struct EditorCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 6) {
                Text("초보 차크닉")
                    .foregroundColor(Color(#colorLiteral(red: 0.8849282861, green: 0.6296796203, blue: 0.5696315765, alpha: 1)))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("차로 떠나는 피크닉")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.top, 34)
            .padding(.leading, 20)
            Image("contentCard1")
                .resizable()
                .scaledToFit()
                .padding(20)
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color(#colorLiteral(red: 0.9317113757, green: 0.8984663486, blue: 0.8601023555, alpha: 1)))
        )
    }
}

struct EditorCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditorCardView()
        EditorCardView()
            .previewDevice("iPod touch (7th generation)")
    }
}
