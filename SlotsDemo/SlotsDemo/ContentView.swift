//
//  ContentView.swift
//  SlotsDemo
//
//  Created by YADU MADHAVAN on 04/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var credits = 1000
    @State private var numbers = [0,0,0]
    private var symbols = ["apple", "star", "cherry"]
    private var betAmount = 5
    var body: some View {
        ZStack {
            Spacer()
            //Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255)).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all
                )
            Spacer()
            VStack {
                Spacer()
                //Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Swift UI Slots")
                        .bold()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                Spacer()
                Text("Credits: \(self.credits)")
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                Spacer()
                HStack {
                    Spacer()
                    Image(self.symbols[self.numbers[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(self.symbols[self.numbers[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(self.symbols[self.numbers[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()
                }
                Spacer()
                //Button
                Button {
                    //Change the images
                    self.numbers[0] = Int.random(in: 0...symbols.count - 1)
                    self.numbers[1] = Int.random(in: 0...symbols.count - 1)
                    self.numbers[2] = Int.random(in: 0...symbols.count - 1)
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        self.credits = self.betAmount * 10
                    } else {
                        self.credits -= self.betAmount
                    }
                } label: {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(10)
                        .padding([.leading, .trailing], 30)
                        .background(.pink)
                        .cornerRadius(20)
                       
                }
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
