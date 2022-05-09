//
//  NewDeckView.swift
//  shout
//
//  Created by Zachary Fertig on 4/13/22.
//

import SwiftUI
import DesignSystem

extension View {
	func hideKeyboard() {
		let resign = #selector(UIResponder.resignFirstResponder)
		UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
	}
}

struct NewDeckView: View {
	
	@State var items: [CardItem]
	@State var title = "Enter Title"
	
	@StateObject var global = Global()
	@AppStorage("deckNames") var deckNames = "Shout! Classic.txt,Easy Pickins.txt,Tough Crowd.txt"
	@AppStorage("dark") var dark:Bool = false
	@AppStorage("decksOn") var decksOn = "true,false,false"
	
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@AppStorage("sliderProgress2") var sliderProgress2 = 1.0
	
	@State var symbolIndex = 0
	var symbolsFull = ["arrow1","arrow3","arrow4","arrow5","arrow6","arrow7","arrow8","blob1","blob2","blob2","blob3","blob4","blob8","blob6","blob7","bowl8","bowl2","bowl3","bowl4","bowl5","bowl6","bowl7","circle1","circle2","circle3","circle8","circle5","circle6","circle7","diamond1","diamond2","diamond3","diamond4","diamond5","diamond6","diamond8","hourglass1","hourglass2","hourglass8","hourglass4","hourglass5","hourglass6","hourglass7","pointy2","pointy3","pointy4","pointy5","pointy6","pointy7","star1","star2","star3","star4","star5","star8","star7"]
		
	var body: some View {
		ZStack {
			if dark {
				Color.DesignSystem.backgroundDark.ignoresSafeArea()
			} else {
				Color.DesignSystem.background.ignoresSafeArea()
			}
			VStack{
				VStack(spacing: UIScreen.main.bounds.height * 0.02) {
					Spacer()
					Image.DesignSystem.newDeckTitle.resizable()
						.frame(width: UIScreen.main.bounds.height * 0.34, height: UIScreen.main.bounds.height * 0.19, alignment: .center)
					Rectangle().fill(Color.DesignSystem.primary).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
					TextField("Enter Title", text: $title)
					Rectangle().fill(Color.DesignSystem.primary).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.005)
				}
				HStack {
					Image.DesignSystem.leftArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.043)
						.onTapGesture {
							if symbolIndex >= 1 {
								symbolIndex = symbolIndex - 1
							} else {
								symbolIndex = symbolsFull.count-1
							}
						}
					Image(symbolsFull[symbolIndex]).resizable()
						.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1)
					Image.DesignSystem.rightArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.043)
						.onTapGesture {
							if symbolIndex <= symbolsFull.count-1 {
								symbolIndex = symbolIndex + 1
							} else {
								symbolIndex = 0
							}
						}
				}
				List {
					ForEach($items) { item in
						TextField("Category", text: item.category)
					}
					.onMove { indexSet, offset in
						items.move(fromOffsets: indexSet, toOffset: offset)
					}
					.onDelete { indexSet in
						items.remove(atOffsets: indexSet)
					}
				}
				HStack {
					Button(action: {
						self.items.append(CardItem(id: UUID(), category: ""))
					}) {
						Text("Add Row")
							.frame(minWidth: UIScreen.main.bounds.height * 0.25)
							.padding(.vertical, 5)
							.foregroundColor(.white)
							.background(Color.DesignSystem.primary)
							.cornerRadius(5)
					}
					Button(action: {
						var listText = ""
						listText = symbolsFull[symbolIndex]
						if items.count >= 1 {
							for i in 0..<items.count {
								if items[i].category != "" {
									if items[i].category.contains(",") {
										items[i].category = items[i].category.replacingOccurrences(of: ",", with: ".")
									}
									listText = listText + "," + items[i].category
								}
							}
						}
						if title != "" && listText != "" {
							if title.contains(",") {
								title = title.replacingOccurrences(of: ",", with: ".")
							}
							let filename = getDocumentsDiretory().appendingPathComponent("\(title).txt")
							decksOn = decksOn + "," + "false"
							global.writeBool(bools: decksOn)
							do {
								try listText.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
								if deckNames == "" {
									deckNames = deckNames + "\(title).txt"
								} else {
									deckNames = deckNames + ",\(title).txt"
								}
							} catch {
								print("failed")
							}
							playSound(sound: "clickOff", type: "mp3", volume: Float(sliderProgress2))
							global.findCustomDecks()
							presentationMode.wrappedValue.dismiss()
						}
					}) {
						Text("Done")
							.frame(minWidth: UIScreen.main.bounds.height * 0.25)
							.padding(.vertical, 5)
							.foregroundColor(.white)
							.background(Color.DesignSystem.primary)
							.cornerRadius(5)
					}
				}
				/*
				Button(action: {
					let filename = getDocumentsDiretory().appendingPathComponent("\(title).txt")
					do {
						let data = try String(contentsOf: filename, encoding: .utf8)
						print(data)
					} catch {
						print("Unable to load saved profile data")
					}
				}) {
					Text("Read")
						.frame(minWidth: 200)
						.padding(.vertical, 5)
						.foregroundColor(.white)
						.background(Color.green)
						.cornerRadius(20)
				}
				 */
			}.ignoresSafeArea().frame(width: UIScreen.main.bounds.width * 0.9)
				.padding(.bottom, UIScreen.main.bounds.height * 0.13)
			.navigationBarBackButtonHidden(true)
			.toolbar { EditButton().foregroundColor(.blue) }
				.onTapGesture {
							hideKeyboard()
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
					presentationMode.wrappedValue.dismiss()
					}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
			}.ignoresSafeArea()
		}
	}
	func getDocumentsDiretory() -> URL {
	 let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
	 return paths[0]
	}
}

struct NewDeckView_Previews: PreviewProvider {
    static var previews: some View {
		NewDeckView(items: [CardItem(id: UUID(), category: "")])
    }
}
