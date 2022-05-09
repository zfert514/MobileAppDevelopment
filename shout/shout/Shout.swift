//
//  Shout.swift
//  shout
//
//  Created by Zachary Fertig on 4/2/22.
//

import Foundation
import SwiftUI

class Shout: ObservableObject {

	//model
	@AppStorage("countBase") var countBase = 8
	var count = 8
	var isSwapping = false
	@Published var symbol = "logo"
	@Published var category = "Ready? \n3..2..1"
	var cat = Category()
	var sym = Symbol()
	
	//MARK: - Access to the Model
	func getCategory() -> String {
		return cat.category
	}
	
	func getSymbol() -> String {
		return sym.symbol
	}
	
	func reset() {
		count = countBase
		cat.reset()
		sym.reset()
		symbol = "logo"
		category = "Ready? \n3..2..1"
	}
	
	func new() {
		if swap() {
			isSwapping = true
		}
		else if check() {
			isSwapping = false
			cat.newCategory()
			category = cat.category
			sym.newSymbol()
			symbol = sym.symbol
		} else {
			shuffle()
		}
	}
	
	func shuffle() {
		symbol = "logo"
		category = "Reshuffling"
		cat.reset()
	}
	
	func check() -> Bool {
		if cat.getCount() < 1 {
			return false
		}
		return true
	}
	
	func swap() -> Bool {
		if count > 0 {
			let num = Int.random(in: 0...count)
			if num == count {
				symbol = "swap"
				let num2 = Int.random(in: 0...3)
				if num2 == 0 {
					category = "Pass Left!"
				} else if num2 == 1 {
					category = "Pass Left X2!"
				} else if num2 == 2 {
					category = "Pass Right X2!"
				} else if num2 == 3 {
					category = "Pass Right!"
				}
				count = countBase
				return true
			}
		}
		count = count - 1
		return false
	}
	
	func makeCard(name: String) -> Card {
		let card = Card(name: name)
		return card
	}
	
	func createDeck(name: String, cards: String) {
		let fileName = "name"
		let documentDirectoryUrl = try! FileManager.default.url(
		  for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true
		)
		let fileUrl = documentDirectoryUrl.appendingPathComponent(fileName).appendingPathExtension("txt")
		// prints the file path
		print("File path \(fileUrl.path)")
		//data to write in file.
		let stringData = cards
		do {
		  try stringData.write(to: fileUrl, atomically: true, encoding: String.Encoding.utf8)
		} catch let error as NSError {
		  print (error)
		}
	}
}
