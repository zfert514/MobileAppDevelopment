//
//  ContentView.swift
//  CardFlip
//
//  Created by Zachary Fertig on 2/25/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Image("2C")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("2D")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                Image("2H")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("2S")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
