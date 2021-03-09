//
//  ContentView.swift
//  ColorMatch
//
//  Created by Zachary Fertig on 3/9/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var colorMatchGame: ColorMatchGame
    
    @State var rGuess: Double = 0.5
    @State var gGuess: Double = 0.5
    @State var bGuess: Double = 0.5
    @State var showAlert: Bool = false
    
    var body: some View {
        
        VStack{
            HStack{
                VStack {
                    Rectangle()
                        .foregroundColor(Color(red: colorMatchGame.getRed(), green: colorMatchGame.getGreen(), blue: colorMatchGame.getBlue()))
                    Text("Match this Color")
                }
                VStack {
                    Rectangle()
                        .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess))
                    HStack{
                        Text("R: \(Int(rGuess * 255))")
                        Text("G: \(Int(gGuess * 255))")
                        Text("B: \(Int(bGuess * 255))")
                    }
                }
            }
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)
            Button(action: {
                self.showAlert = true
            }, label: {
                Text("Guess!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 3))
            })
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Your score"), message: Text("\(colorMatchGame.computeScore(rGuess: rGuess, gGuess: gGuess, bGuess: bGuess))"))
                })
        }
    }
}

struct ColorSlider: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack{
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
            Text("255")
                .foregroundColor(textColor)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(colorMatchGame: ColorMatchGame())
    }
}
