//
//  AppButton.swift
//  EMMOATO
//
//  Created by Pawan Singh on 17/02/25.
//

import SwiftUI

struct AppButton: View {
    let title: String
    let action: () -> Void
    let color : Color
    let textColor: Color
    let font: Font
    init(action: @escaping () -> Void, title: String, color: Color, textColor: Color,  fontSize:UIFont) {
        self.action = action
        self.title = title
        self.color = color
        self.textColor = textColor
        self.font = Font(fontSize)
    }
    var body: some View {
        Button(
            action: action,
            label: {
                Text(title)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .background(color)
                    .font(font)
                    .foregroundColor(self.textColor)
                    .cornerRadius(10)
            }
        )
    }
    
}

struct ScreenBackground: View {
    let color: Color
    init(color: Color) {
        self.color = color
    }
    
    init(uiColor: UIColor) {
        self.color = .init(uiColor: uiColor)
    }
    
    init(hex: String) {
        let color = UIColor(hex: "#263645") ?? .white
        self.color = .init(uiColor: color)
    }
    
    var body: some View {
        color
            .edgesIgnoringSafeArea(.all)
    }
}
