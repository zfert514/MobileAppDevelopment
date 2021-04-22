//
//  ContentView.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
         * Skipping straight to the GameView.
         * Could replace this with a menu UI that
         * eventually leads to the GameView.
         */
        GameView(manager: GameManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
