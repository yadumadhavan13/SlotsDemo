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
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
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
                    CardView(symbol: $symbols[numbers[0]], background: $backgrounds[numbers[0]])
                    CardView(symbol: $symbols[numbers[1]], background: $backgrounds[numbers[1]])
                    CardView(symbol: $symbols[numbers[2]], background: $backgrounds[numbers[2]])
                    Spacer()
                }
                Spacer()
                //Button
                Button {
                    //set background to white
                    self.backgrounds = self.backgrounds.map { _ in
                        Color.white
                    }
                    //Change the images
                    self.numbers = self.numbers.map({ _ in
                        Int.random(in: 0...symbols.count - 1)
                    })
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        self.credits = self.betAmount * 10
                        //set background to green
                        self.backgrounds = self.backgrounds.map { _ in
                            Color.green
                        }
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
