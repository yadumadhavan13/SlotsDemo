//
//  CardView.swift
//  SlotsDemo
//
//  Created by YADU MADHAVAN on 05/09/22.
//

import SwiftUI

struct CardView: View {
    @Binding var symbol: String
    @Binding var background: Color
    var body: some View {
        Image(self.symbol)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(background.opacity(0.5))
            .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("apple"), background: Binding.constant(Color.white.opacity(0.5)))
    }
}
