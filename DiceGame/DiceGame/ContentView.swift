//
//  ContentView.swift
//  DiceGame
//
//  Created by Zachary Fertig on 3/4/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("2")
                Text("3")
                Text("4")
                Text("5")
                Text("6")
                Text("7")
                Text("8")
                Text("9")
                Text("10")
                Text("11")
            }
            VStack(alignment: .trailing){
                Image("dice-six-faces-five")
                .resizable()
                .aspectRatio(contentMode: .fit)
                Image("dice-six-faces-one")
                .resizable()
                .aspectRatio(contentMode: .fit)
                Image("dice-six-faces-six")
                .resizable()
                .aspectRatio(contentMode: .fit)
                Image("dice-six-faces-two")
                .resizable()
                .aspectRatio(contentMode: .fit)
                Image("dice-six-faces-three")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Roll Dice")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                .padding(5.0)
                .background(Color.clear)
                .cornerRadius(/*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
