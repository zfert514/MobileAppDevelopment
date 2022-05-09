//
//  LoadView.swift
//  shout
//
//  Created by Zachary Fertig on 4/1/22.
//

import SwiftUI
import DesignSystem

struct LoadView: View {
	@AppStorage("first") var first = true
	
    var body: some View {
		ZStack {
			Image.DesignSystem.bg.onTapGesture {
				first = false
			}
		}.ignoresSafeArea(.all)
	}
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView()
    }
}
