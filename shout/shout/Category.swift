//
//  Category.swift
//  shout
//
//  Created by Zachary Fertig on 4/2/22.
//

import SwiftUI
import DesignSystem

struct Category {
	@AppStorage("deck1") var isDeck1:Bool = true
	@AppStorage("deck2") var isDeck2:Bool = false
	@AppStorage("deck3") var isDeck3:Bool = false
	
	@AppStorage("deckNames") var deckNames = ""
	@AppStorage("decksOn") var decksOn = ""
	
	@StateObject var global = Global()
	
	var decks: Array<Deck> = Array<Deck>()
	var category = ""
	var categories = Array<String>()
	
	init() {
		reset()
		newCategory()
	}
	
	mutating func newCategory() {
		if categories.count > 0 {
			let num = Int.random(in: 0..<categories.count)
			category = categories[num]
			categories.remove(at: num)
		}
	}
	
	mutating func getCount() -> Int {
		return categories.count
	}
	
	mutating func reset() {
		let filename = getDocumentsDiretory().appendingPathComponent("categories.txt")
		do {
			let data = try String(contentsOf: filename, encoding: .utf8)
			categories = data.components(separatedBy: ",")
		} catch {
			print("Unable to load saved profile data")
		}
	}
	
	mutating func cardsCount() -> Int {
		return categories.count
	}
}
