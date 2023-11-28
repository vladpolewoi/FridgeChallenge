//
//  HeaderView.swift
//  FridgeChallenge
//
//  Created by Quest76 on 27.11.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("0:25")
                    .font(.system(size: 54, weight: .heavy).monospaced())
                
                Text("23 moves")
                    .foregroundStyle(.gray)
                    .italic()
            }
            
            HStack(alignment: .top) {
                Spacer()
                
                Button {
                    
                } label : {
                    Image(systemName: "arrow.clockwise.circle")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .buttonStyle(.borderless)
                .tint(.orange)
            }
        }.padding(.horizontal, 24)
    }
}

#Preview {
    HeaderView()
}
