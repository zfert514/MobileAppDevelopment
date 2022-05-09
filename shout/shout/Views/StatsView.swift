//
//  StatsView.swift
//  shout
//
//  Created by Zachary Fertig on 4/2/22.
//

import SwiftUI
import DesignSystem

struct StatsView: View {
	@AppStorage("dark") var dark:Bool = false
	@AppStorage("sliderProgress2") var sliderProgress2 = 1.0
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
		ZStack {
			if dark {
				Color.DesignSystem.backgroundDark.ignoresSafeArea()
			} else {
				Color.DesignSystem.background.ignoresSafeArea()
			}
			VStack(alignment: .leading) {
				VStack(spacing: 20.0) {
					VStack {
						Image.DesignSystem.statsTitle.resizable()
							.frame(width: UIScreen.main.bounds.height * 0.25, height: UIScreen.main.bounds.height * 0.19, alignment: .center)
					}.padding(.top, UIScreen.main.bounds.height * 0.05)
					Text("Longest Game")
						.foregroundColor(Color.DesignSystem.body)
						.font(Font.DesignSystem.header)
					ZStack {
						Rectangle().fill(Color.DesignSystem.secondary)
							.frame(width: UIScreen.main.bounds.width / 1.1, height: 60)
						Text("33 min")
							.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
							.font(Font.DesignSystem.bigBody)
					}
					Text("Quickest Shout!")
						.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
						.font(Font.DesignSystem.header)
					ZStack {
						Rectangle().fill(Color.DesignSystem.secondary)
							.frame(width: UIScreen.main.bounds.width / 1.1, height: 60)
						Text("4")
							.foregroundColor(Color.DesignSystem.body)
							.font(Font.DesignSystem.bigBody)
					}
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
				ZStack {
					VStack(spacing: 0) {
						Rectangle().fill(Color.DesignSystem.primary).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
					}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
					Image.DesignSystem.leftArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
						.padding(.leading, UIScreen.main.bounds.width * 0.05)
						.padding(.bottom, UIScreen.main.bounds.width * 0.05)
						.onTapGesture {
						playSound(sound: "clickOff", type: "mp3", volume: Float(sliderProgress2))
						presentationMode.wrappedValue.dismiss()
						}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
				}
			}
		}.ignoresSafeArea()
			.navigationBarHidden(true)
			.navigationBarBackButtonHidden(true)
	}
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
