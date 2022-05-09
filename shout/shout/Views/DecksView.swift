//
//  DecksView.swift
//  shout
//
//  Created by Zachary Fertig on 4/2/22.
//

import SwiftUI
import DesignSystem

struct PickDeck: View {
	
	var image:Image
	var title:String
	var active:Bool
	
	@AppStorage("dark") var dark:Bool = false
	
	var body: some View {
		ZStack {
			if active {
				Color.DesignSystem.primary
			} else {
				Color.DesignSystem.secondary
			}
			VStack {
				image.resizable()
					.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1)
					.padding()
				Text(title)
					.foregroundColor(Color.DesignSystem.body)
					.font(Font.DesignSystem.smallBody).padding()
			}
		}
	}
}

struct DecksView: View {
	@AppStorage("dark") var dark:Bool = false
	@AppStorage("sliderProgress2") var sliderProgress2 = 1.0
	
	@AppStorage("deckNames") var deckNames = ""
	@AppStorage("deckCount") var deckCount = 1
	@AppStorage("decksOn") var decksOn = "true,false,false"
	
	@StateObject var global = Global()

	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
    var body: some View {
		ZStack {
			if dark {
				Color.DesignSystem.backgroundDark.ignoresSafeArea()
			} else {
				Color.DesignSystem.background.ignoresSafeArea()
			}
			VStack(alignment: .center) {
				VStack {
					VStack(spacing: UIScreen.main.bounds.height * 0.01) {
						Image.DesignSystem.packsTitle.resizable()
							.frame(width: UIScreen.main.bounds.height * 0.26, height: UIScreen.main.bounds.height * 0.19, alignment: .center)
						Text("Decks Activated: \(deckCount)")
							.font(Font.DesignSystem.header)
							.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
						Rectangle().fill(Color.DesignSystem.primary).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
					}.padding(.top, UIScreen.main.bounds.height * 0.05)
					ScrollView {
						VStack(spacing: UIScreen.main.bounds.height * 0.005) {
							ForEach(0..<global.deckDict.count, id: \.self) { deck in
								HStack(spacing: UIScreen.main.bounds.height * 0.01) {
									if deck%2 == 0 {
										PickDeck(image: Image(global.deckDict[deck].image), title: global.deckDict[deck].title, active: global.deckDict[deck].isActive)
										.border(global.deckDict[deck].isActive ? Color.DesignSystem.white : Color.DesignSystem.secondary, width: 7.0)
										.onTapGesture {
											if global.deckDict[deck].isActive && deckCount > 1 {
												deckCount = deckCount - 1
												global.deckDict[deck].isActive = false
											} else if !global.deckDict[deck].isActive {
												deckCount = deckCount + 1
												global.deckDict[deck].isActive = true
											}
										}
										if deck+1 < global.deckDict.count {
											PickDeck(image: Image(global.deckDict[deck+1].image), title: global.deckDict[deck+1].title, active: global.deckDict[deck+1].isActive)
											.border(global.deckDict[deck+1].isActive ? Color.DesignSystem.white : Color.DesignSystem.secondary, width: 7.0)
											.onTapGesture {
												if global.deckDict[deck+1].isActive && deckCount > 1 {
													deckCount = deckCount - 1
													global.deckDict[deck+1].isActive = false
												} else if !global.deckDict[deck+1].isActive {
													deckCount = deckCount + 1
													global.deckDict[deck+1].isActive = true
												}
											}
										}
									}
									if deck+1 == global.deckDict.count {
										VStack {
											NavigationLink(destination: NewDeckView(items: [CardItem(id: UUID(), category: "")])) {
												PickDeck(image: Image.DesignSystem.logo, title: "New Card", active: false)
												.border(Color.DesignSystem.secondary, width: 7.0)
											}
										}.onTapGesture {
											presentationMode.wrappedValue.dismiss()
										}
									}
								}
							}
						}.frame(width: UIScreen.main.bounds.width * 0.95)
					}.padding(.bottom, UIScreen.main.bounds.height * 0.13)
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
			}
			ZStack {
				VStack(spacing: 0) {
					Rectangle().fill(Color.DesignSystem.primary).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
					Rectangle().fill(dark ? Color.DesignSystem.backgroundDark : Color.DesignSystem.background).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.11)
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
				Image.DesignSystem.leftArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
					.padding(.leading, UIScreen.main.bounds.width * 0.05)
					.padding(.bottom, UIScreen.main.bounds.width * 0.05)
					.onTapGesture {
					playSound(sound: "clickOff", type: "mp3", volume: Float(sliderProgress2))
						decksOn = String(global.deckDict[0].isActive)
						for i in 1..<global.deckDict.count {
							decksOn = decksOn + "," + String(global.deckDict[i].isActive)
						}
						global.make()
					presentationMode.wrappedValue.dismiss()
					}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
			}
		}.ignoresSafeArea()
			.navigationBarHidden(true)
			.navigationBarBackButtonHidden(true)
		
    }
}

struct DecksView_Previews: PreviewProvider {
    static var previews: some View {
		DecksView()
    }
}
