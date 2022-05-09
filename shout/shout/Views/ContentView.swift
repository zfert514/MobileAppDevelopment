//
//  ContentView.swift
//  shout
//
//  Created by Zachary Fertig on 4/1/22.
//

import SwiftUI
import DesignSystem

struct ContentView: View {
	@AppStorage("first") var first = false
	
    var body: some View {
		if first {
			HowToView()
		} else {
			MainView()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
