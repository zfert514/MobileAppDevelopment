//
//  ContentView.swift
//  DiceGame
//
//  Created by Zachary Fertig on 3/4/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var diceGame: DiceGame
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("2")
                        .font(.title)
                        .bold()
                    Text("3")
                        .font(.title)
                        .bold()
                    Text("4")
                        .font(.title)
                        .bold()
                    Text("5")
                        .font(.title)
                        .bold()
                    Text("6")
                        .font(.title)
                        .bold()
                    Text("7")
                        .font(.title)
                        .bold()
                    Text("8")
                        .font(.title)
                        .bold()
                    Text("9")
                        .font(.title)
                        .bold()
                    Text("10")
                        .font(.title)
                        .bold()
                    Text("11")
                        .font(.title)
                        .bold()
                }
                .padding()
                Spacer()
                VStack {
                    DieImage(diceGame: diceGame, index: 0)
                    DieImage(diceGame: diceGame, index: 1)
                    DieImage(diceGame: diceGame, index: 2)
                    DieImage(diceGame: diceGame, index: 3)
                    DieImage(diceGame: diceGame, index: 4)
                }
                .padding()
            }
            Button(action: {
                diceGame.rollDice()
            }) {
                Text("Roll Dice")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 3))
            }
        }
    }
}

struct DieImage: View {
    
    @ObservedObject var diceGame: DiceGame
    var index: Int
    
    var body: some View {
        Image(diceGame.get(index: index).name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .colorMultiply(diceGame.getColor(index: index))
            .onTapGesture {
                self.diceGame.tap(index: index)
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(diceGame: DiceGame())
    }
}
