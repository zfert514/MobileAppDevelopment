//
//  Main.swift
//  shout
//
//  Created by Zachary Fertig on 4/1/22.
//

import SwiftUI
import DesignSystem

struct MainView: View {
	@AppStorage("dark") var dark:Bool = false
	var body: some View {
		NavigationView {
			ZStack {
				if dark {
					Color.DesignSystem.backgroundDark.ignoresSafeArea()
					Image.DesignSystem.bgDark.resizable().ignoresSafeArea()
				} else {
					Color.DesignSystem.background.ignoresSafeArea()
					Image.DesignSystem.bg2.resizable().ignoresSafeArea()
				}
				VStack {
					VStack {
						Image.DesignSystem.logo
							.resizable()
							.frame(width: UIScreen.main.bounds.height * 0.38, height: UIScreen.main.bounds.height * 0.24, alignment: .center)
					}.padding(.top, UIScreen.main.bounds.height * 0.05)
					HStack(spacing: UIScreen.main.bounds.width * 0.35) {
						VStack {
							NavigationLink(destination: HowToView()) {
								Image.DesignSystem.howTo.resizable()
									.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1, alignment: .center)
							}
						}
						.padding(.top, UIScreen.main.bounds.height * 0.07)
						NavigationLink(destination: SettingsView()) {
							Image.DesignSystem.settings.resizable()
								.frame(width: UIScreen.main.bounds.height * 0.15, height: UIScreen.main.bounds.height * 0.15, alignment: .center)
						}
					}
					NavigationLink(destination: CardView(shout: Shout())) {
						Image.DesignSystem.play.resizable()
							.frame(width: UIScreen.main.bounds.height * 0.24, height: UIScreen.main.bounds.height * 0.24, alignment: .center)
					}
					HStack(spacing: UIScreen.main.bounds.width * 0.25) {
						VStack {
							NavigationLink(destination: StatsView()) {
								Image.DesignSystem.stats.resizable()
									.frame(width: UIScreen.main.bounds.height * 0.125, height: UIScreen.main.bounds.height * 0.125, alignment: .center)
							}
						}
						.padding(.top, UIScreen.main.bounds.height * 0.05)
						ZStack {
							VStack {
								NavigationLink(destination: DecksView()) {
									Image.DesignSystem.packs.resizable()
										.frame(width: UIScreen.main.bounds.height * 0.15, height: UIScreen.main.bounds.height * 0.15, alignment: .center)
								}
							}
						}
					}
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
				VStack(spacing: 0) {
					Rectangle().fill(Color.DesignSystem.primary).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
			}.ignoresSafeArea().navigationBarHidden(true)
			 .navigationBarBackButtonHidden(true)
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}

