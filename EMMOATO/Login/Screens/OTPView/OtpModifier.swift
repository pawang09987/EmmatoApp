//
//  OtpModifier.swift
//  EMMOATO
//
//  Created by Pawan Singh on 18/02/25.
//

import SwiftUI
import Combine

struct OtpModifer: ViewModifier {

    @Binding var pin : String

    var textLimt = 1

    func limitText(_ upper : Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }
    func body(content: Content) -> some View {
            content
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .onReceive(Just(pin)) {_ in limitText(textLimt)}
                .frame(width: 35, height: 35)
                .background(Color.white.cornerRadius(5))
                .background(
                RoundedRectangle(cornerRadius: 5)
                .stroke(Color("blueColor"), lineWidth: 1)
                )
        }
    
    }
