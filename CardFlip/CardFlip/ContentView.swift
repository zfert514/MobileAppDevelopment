//
//  ContentView.swift
//  CardFlip
//
//  Created by Zachary Fertig on 2/25/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var flipCard: FlipCard
    
    var body: some View {
        VStack {
            HStack {
                Image(flipCard.get(index: 0).face)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        self.flipCard.tap(index: 0)
                    }
                Image(flipCard.get(index: 1).face)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        self.flipCard.tap(index: 1)
                    }
            }
            HStack {
                Image(flipCard.get(index: 2).face)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        self.flipCard.tap(index: 2)
                    }
                Image(flipCard.get(index: 3).face)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        self.flipCard.tap(index: 3)
                    }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(flipCard: FlipCard())
    }
}
