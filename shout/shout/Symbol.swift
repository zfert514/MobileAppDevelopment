//
//  Symbol.swift
//  shout
//
//  Created by Zachary Fertig on 4/2/22.
//

import SwiftUI
import DesignSystem

struct Symbol {
	
	@AppStorage("arrowOff") var arrowOff:Bool = false
	@AppStorage("blobOff") var blobOff:Bool = false
	@AppStorage("bowlOff") var bowlOff:Bool = false
	@AppStorage("circleOff") var circleOff:Bool = false
	@AppStorage("diamondOff") var diamondOff:Bool = false
	@AppStorage("hourglassOff") var hourglassOff:Bool = false
	@AppStorage("pointyOff") var pointyOff:Bool = false
	@AppStorage("starOff") var starOff:Bool = false
	
	var number = ""
	var symbol = ""
	var symbols = Array<String>()
	var symbolsFull = ["arrow1","arrow3","arrow4","arrow5","arrow6","arrow7","arrow8","blob1","blob2","blob2","blob3","blob4","blob8","blob6","blob7","bowl8","bowl2","bowl3","bowl4","bowl5","bowl6","bowl7","circle1","circle2","circle3","circle8","circle5","circle6","circle7","diamond1","diamond2","diamond3","diamond4","diamond5","diamond6","diamond8","hourglass1","hourglass2","hourglass8","hourglass4","hourglass5","hourglass6","hourglass7","pointy2","pointy3","pointy4","pointy5","pointy6","pointy7","star1","star2","star3","star4","star5","star8","star7"]
	
	init() {
		reset()
		newSymbol()
	}
	
	mutating func newSymbol() {
		let num = Int.random(in: 0..<symbols.count)
		symbol = symbols[num]
		
		let last = symbol.last!
		number = "\(last)"
	}
	
	mutating func getCount() -> Int {
		return symbols.count
	}
	
	mutating func reset() {
		symbols = symbolsFull
		if bowlOff {
			symbols.removeAll(where: { $0.contains("bowl") })
			symbols.removeAll(where: { $0.contains("1") })
		}
		if arrowOff {
			symbols.removeAll(where: { $0.contains("arrow") })
			symbols.removeAll(where: { $0.contains("2") })
		}
		if hourglassOff {
			symbols.removeAll(where: { $0.contains("hourglass") })
			symbols.removeAll(where: { $0.contains("3") })
		}
		if circleOff {
			symbols.removeAll(where: { $0.contains("circle") })
			symbols.removeAll(where: { $0.contains("4") })
		}
		if blobOff {
			symbols.removeAll(where: { $0.contains("blob") })
			symbols.removeAll(where: { $0.contains("5") })
		}
		if starOff {
			symbols.removeAll(where: { $0.contains("star") })
			symbols.removeAll(where: { $0.contains("6") })
		}
		if diamondOff {
			symbols.removeAll(where: { $0.contains("diamond") })
			symbols.removeAll(where: { $0.contains("7") })
		}
		if pointyOff {
			symbols.removeAll(where: { $0.contains("pointy") })
			symbols.removeAll(where: { $0.contains("8") })
		}
	}
}
