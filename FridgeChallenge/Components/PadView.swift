//
//  PadView.swift
//  FridgeChallenge
//
//  Created by Quest76 on 25.11.2023.
//

import SwiftUI

struct PadView: View {
    @Binding var isFlipped: Bool
    
    var body: some View {
        ZStack {
            Color(isFlipped ? .oceanDark : .grapeDark)
                .cornerRadius(25)
                .offset(y: isFlipped ? -10 : 10 )
            Color(isFlipped ? .oceanLight : .grapeLight)
                .cornerRadius(25)
                .offset(y: isFlipped ? -1 : 1)
            Color(isFlipped ? .oceanMedium : .grapeMedium)
                .cornerRadius(25)
        }
        .rotation3DEffect(
            isFlipped ? Angle(degrees: 180) : Angle(degrees: 0),
            axis: (x: 1, y: 0, z:0),
            perspective: 0.4
        )
        .animation(.snappy, value: isFlipped)
    }
}

#Preview {
    VStack {
        PadView(isFlipped: .constant(false))
        PadView(isFlipped: .constant(true))
    }
    .frame(width: 200, height: 200)
    .padding()
}
