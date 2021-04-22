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
                    Group {
                    NumberText(diceGame: diceGame, index: 0)
                    NumberText(diceGame: diceGame, index: 1)
                    NumberText(diceGame: diceGame, index: 2)
                    NumberText(diceGame: diceGame, index: 3)
                    NumberText(diceGame: diceGame, index: 4)
                    NumberText(diceGame: diceGame, index: 5)
                    NumberText(diceGame: diceGame, index: 6)
                    NumberText(diceGame: diceGame, index: 7)
                    NumberText(diceGame: diceGame, index: 8)
                    NumberText(diceGame: diceGame, index: 9)
                    }
                    NumberText(diceGame: diceGame, index: 10)
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
            ButtonView(diceGame: diceGame)
        }
    }
}

struct ButtonView: View {
    
    @ObservedObject var diceGame: DiceGame
    @State private var showAlert = false
    
    var body: some View {

        Button(action: {
	            diceGame.rollDice()
            if (diceGame.noMoves()) {
                showAlert.toggle()
            }
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
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Game Over"), message: Text("No Moves Left"))
        })
    }
}

struct DieImage: View {
    
    @ObservedObject var diceGame: DiceGame
    var index: Int
    
    var body: some View {
        Image(diceGame.getFace(index: index).name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .colorMultiply(diceGame.getColorDie(index: index))
            .onTapGesture {
                self.diceGame.tap(index: index)
            }
    }
}

struct NumberText: View {
    
    @ObservedObject var diceGame: DiceGame
    var index: Int
    
    var body: some View {
        Text(diceGame.getNum(index: index).name)
            .font(.title)
            .bold()
            .foregroundColor(diceGame.getColorNum(index: index))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(diceGame: DiceGame())
    }
}

