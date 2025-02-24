//
//  AppTextField.swift
//  EMMOATO
//
//  Created by Pawan Singh on 17/02/25.
//

import SwiftUI

struct AppTextField: View {
    let titleKey: String
    let image: Image?
    let bgColor: Color
    let textColor:Color
    let height: CGFloat
    @Binding var text: String
    
    init(_ titleKey: String = "", image: Image? = nil, text: Binding<String>, bgColor: Color? = nil, textcolor:Color? = nil, height: CGFloat? = nil) {
        self.titleKey = titleKey
        self._text = text
        self.image = image
        self.bgColor = bgColor ?? .white
        self.textColor = textcolor ?? .black
        self.height = height ?? 40
    }
    
    var body: some View {
        HStack{
            if let image = image {
                image
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                    .frame(width: 24, height: 24)
            }
            TextField(titleKey, text: $text)
                .foregroundColor(self.textColor)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .frame(height: height)
        .background(bgColor)
        .cornerRadius(height / 5.0)
    }
}

struct AppSecureField: View {
    let titleKey: String
    let image: Image?
    let bgColor: Color
    let textColor:Color
    let height: CGFloat
    @Binding var text: String
    
    init(_ titleKey: String = "", image: Image? = nil, text: Binding<String>, bgColor: Color? = nil, textcolor:Color? = nil, height: CGFloat? = nil) {
        self.titleKey = titleKey
        self._text = text
        self.image = image
        self.bgColor = bgColor ?? .white
        self.textColor = textcolor ?? .black
        self.height = height ?? 40
    }
    
    var body: some View {
        HStack{
            if let image = image {
                image
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                    .frame(width: 24, height: 24)
            }
            SecureField(titleKey, text: $text)
                .foregroundColor(self.textColor)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .frame(height: height)
        .background(bgColor)
        .cornerRadius(height / 5.0)
    }
}

//#Preview {
//    AppTextField(placeholder: "abc", text: Binding(get: {
//        ""
//    }, set: { Valu in
//        print(Valu)
//    }))
//}
