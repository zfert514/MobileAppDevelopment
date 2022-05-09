//
//  SettingsView.swift
//  shout
//
//  Created by Zachary Fertig on 4/1/22.
//

import SwiftUI
import DesignSystem

struct SettingsView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
	@AppStorage("countBase") var countBase = 8
	
	@AppStorage("arrowOff") var arrowOff:Bool = false
	@AppStorage("blobOff") var blobOff:Bool = false
	@AppStorage("bowlOff") var bowlOff:Bool = false
	@AppStorage("circleOff") var circleOff:Bool = false
	@AppStorage("diamondOff") var diamondOff:Bool = false
	@AppStorage("hourglassOff") var hourglassOff:Bool = false
	@AppStorage("pointyOff") var pointyOff:Bool = false
	@AppStorage("starOff") var starOff:Bool = false
	
	@AppStorage("blind") var blind:Bool = false
	@AppStorage("dark") var dark:Bool = false
	@AppStorage("auto") var auto:Bool = true
	@AppStorage("manual") var manual:Bool = false
	
	@AppStorage("switchIndex") var switchIndex = 2
	@AppStorage("flipIndex") var flipIndex = 1
	@AppStorage("timerIndex") var timerIndex = 0
	@AppStorage("switchTime") var switchTime = 5
	
	@AppStorage("symbolsCounts") var symbols = 8
	
	@State var maxHeight = UIScreen.main.bounds.width / 2
	
	//Slider Properties
	@AppStorage("sliderProgress1") var sliderProgress1 = 1.0
	@AppStorage("sliderHeight1") var sliderHeight1 = UIScreen.main.bounds.width / 2.0
	@AppStorage("lastDragValue1") var lastDragValue1 = UIScreen.main.bounds.width / 2.0
	
	@AppStorage("sliderProgress2") var sliderProgress2 = 1.0
	@AppStorage("sliderHeight2") var sliderHeight2 = UIScreen.main.bounds.width / 2.0
	@AppStorage("lastDragValue2") var lastDragValue2 = UIScreen.main.bounds.width / 2.0
	
	var body: some View {
		ZStack {
			if dark {
				Color.DesignSystem.backgroundDark.ignoresSafeArea()
			} else {
				Color.DesignSystem.background.ignoresSafeArea()
			}
			VStack(spacing: UIScreen.main.bounds.height * 0.01) {
				VStack {
					Image.DesignSystem.settingsTitle.resizable()
						.frame(width: UIScreen.main.bounds.height * 0.35, height: UIScreen.main.bounds.height * 0.19, alignment: .center)
					Rectangle().fill(Color.DesignSystem.primary).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
				}.padding(.top, UIScreen.main.bounds.height * 0.05)
				ScrollView {
					VStack(alignment: .leading) {
						VStack(alignment: .leading, spacing: UIScreen.main.bounds.height * 0.02) {
							Text("Display")
								.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
								.font(Font.DesignSystem.header)
							  HStack() {
								  VStack {
									  Text("Dark Mode")
										  .foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
										  .font(Font.DesignSystem.regularBody)
								  }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
								  VStack {
									  Rectangle().fill(dark ? Color.DesignSystem.primary : Color.DesignSystem.secondary).onTapGesture {
										  if dark {
											  playSound(sound: "clickOn", type: "mp3", volume: Float(sliderProgress2))
										  } else {
											  playSound(sound: "clickOff", type: "mp3", volume: Float(sliderProgress2))
										  }
										  dark = !dark
									  }.frame(width: UIScreen.main.bounds.height * 0.05, height: UIScreen.main.bounds.height * 0.05, alignment: .trailing)
								  }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
							  }
							HStack() {
								VStack {
									Text("Color Blind")
										.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
										.font(Font.DesignSystem.regularBody)
								}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
								VStack {
									Rectangle().fill(blind ? Color.DesignSystem.primary : Color.DesignSystem.secondary).onTapGesture {
										if blind {
											playSound(sound: "clickOn", type: "mp3", volume: Float(sliderProgress2))
										} else {
											playSound(sound: "clickOff", type: "mp3", volume: Float(sliderProgress2))
										}
										blind = !blind
									}.frame(width: UIScreen.main.bounds.height * 0.05, height: UIScreen.main.bounds.height * 0.05, alignment: .trailing)
								}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
							}
						}
						VStack(alignment: .leading, spacing: UIScreen.main.bounds.height * 0.02) {
							Text("Sound")
								.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
								.font(Font.DesignSystem.header)
							HStack() {
								VStack {
									Text("Music")
										.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
										.font(Font.DesignSystem.regularBody)
								}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
								ZStack(alignment: .leading, content: {
									Rectangle().fill(Color.DesignSystem.secondary).opacity(1)
									Rectangle().fill(Color.DesignSystem.primary)
										.frame(width: sliderHeight1)
								}).frame(width: maxHeight, height: UIScreen.main.bounds.height * 0.04 , alignment: .leading).cornerRadius(5)
									.overlay(
										Text("\(Int(sliderProgress1 * 100))%")
											.font(Font.DesignSystem.smallLight)
											.padding(.vertical, 2)
											.padding(.horizontal, 4.5)
											.background(Color.DesignSystem.background)
											.cornerRadius(10)
											.padding(.vertical, 7.5)
											.offset(x: sliderHeight1 < maxHeight - 50 ? sliderHeight1 : maxHeight - 50)
										,alignment: .leading
										)
									.gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
										//get drag value
										let translation = value.translation
										sliderHeight1 = translation.width + lastDragValue1
										//limit
										sliderHeight1 = sliderHeight1 > maxHeight ? maxHeight : sliderHeight1
										//negatives
										sliderHeight1 = sliderHeight1 >= 0 ? sliderHeight1 : 0
										//update
										let progress1 = sliderHeight1 / maxHeight
										sliderProgress1 = progress1 <= 1.0 ? progress1 : 1
									}).onEnded({ (value) in
										//limit
										sliderHeight1 = sliderHeight1 > maxHeight ? maxHeight : sliderHeight1
										//negatives
										sliderHeight1 = sliderHeight1 >= 0 ? sliderHeight1 : 0
										//storing
										lastDragValue1 = sliderHeight1
										playSound(sound: "lowClick", type: ".mp3", volume: Float(sliderProgress2))
									}))
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
							HStack() {
								VStack {
									Text("SFX")
										.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
										.font(Font.DesignSystem.regularBody)
								}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
								ZStack(alignment: .leading, content: {
									Rectangle().fill(Color.DesignSystem.secondary).opacity(1)
									Rectangle().fill(Color.DesignSystem.primary)
										.frame(width: sliderHeight2)
								}).frame(width: maxHeight, height: UIScreen.main.bounds.height * 0.04 , alignment: .leading).cornerRadius(5)
									.overlay(
										Text("\(Int(sliderProgress2 * 100))%")
											.font(Font.DesignSystem.smallLight)
											.padding(.vertical , 2)
											.padding(.horizontal, 4.5)
											.background(Color.DesignSystem.background)
											.cornerRadius(10)
											.padding(.vertical, 7.5)
											.offset(x: sliderHeight2 < maxHeight - 50 ? sliderHeight2 : maxHeight - 50)
										,alignment: .leading
										)
									.gesture(DragGesture(minimumDistance: 0).onChanged({ (value) in
										//get drag value
										let translation = value.translation
										sliderHeight2 = translation.width + lastDragValue2
										//limit
										sliderHeight2 = sliderHeight2 > maxHeight ? maxHeight : sliderHeight2
										//negatives
										sliderHeight2 = sliderHeight2 >= 0 ? sliderHeight2 : 0
										//update
										let progress2 = sliderHeight2 / maxHeight
										sliderProgress2 = progress2 <= 1.0 ? progress2 : 1
									}).onEnded({ (value) in
										//limit
										sliderHeight2 = sliderHeight2 > maxHeight ? maxHeight : sliderHeight2
										//negatives
										sliderHeight2 = sliderHeight2 >= 0 ? sliderHeight2 : 0
										//storing
										lastDragValue2 = sliderHeight2
										playSound(sound: "lowClick", type: ".mp3", volume: Float(sliderProgress2))
									}))
							}
							VStack(alignment: .leading) {
								Text("Gameplay")
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
									.font(Font.DesignSystem.header)
								HStack() {
									Text("Card Flip")
										.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
										.font(Font.DesignSystem.regularBody)
									VStack {
										HStack(spacing: UIScreen.main.bounds.height * 0.05){
											Image.DesignSystem.left.onTapGesture {
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
												auto = !auto
												timerIndex = timerIndex - 1
												if timerIndex == -1 {
													timerIndex = 2
												}
												if timerIndex == 0 {
													auto = true
													manual = false
												} else if timerIndex == 1 {
													auto = false
													manual = true
												} else {
													auto = true
													manual = true
												}
											}
											if timerIndex == 0 {
												Text("Auto")
													.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
													.font(Font.DesignSystem.smallBody)
											}
											else if timerIndex == 1 {
												Text("Manual")
													.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
													.font(Font.DesignSystem.smallBody)
											}
											else {
												Text("Both")
													.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
													.font(Font.DesignSystem.smallBody)
											}
											Image.DesignSystem.right.onTapGesture {
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
												timerIndex = timerIndex + 1
												if timerIndex == 3 {
													timerIndex = 0
												}
												if timerIndex == 0 {
													auto = true
													manual = false
												} else if timerIndex == 1 {
													auto = false
													manual = true
												} else {
													auto = true
													manual = true
												}
											}
										}
									}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
								}
								HStack() {
									Text("Card Timer")
										.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
										.font(Font.DesignSystem.regularBody)
									VStack {
										HStack(spacing: UIScreen.main.bounds.height * 0.05){
											Image.DesignSystem.left.onTapGesture {
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
												flipIndex = flipIndex - 1
												if flipIndex == 0 {
													flipIndex = 4
												}
												switchTime = 5 * flipIndex
											}
											Text("\(switchTime)s")
												.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
												.font(Font.DesignSystem.smallBody)
											Image.DesignSystem.right.onTapGesture {
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
												flipIndex = flipIndex + 1
												if flipIndex == 5 {
													flipIndex = 1
												}
												switchTime = 5 * flipIndex
											}
										}
									}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
								}
								HStack() {
									Text("Pass Every")
										.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
										.font(Font.DesignSystem.regularBody)
									VStack {
										HStack(spacing: UIScreen.main.bounds.height * 0.05){
											Image.DesignSystem.left.onTapGesture {
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
												switchIndex = switchIndex - 1
												if switchIndex == -1 {
													switchIndex = 3
												}
												countBase = 4 * switchIndex
											}
											Text("\(countBase)")
												.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
												.font(Font.DesignSystem.smallBody)
											Image.DesignSystem.right.onTapGesture {
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
												switchIndex = switchIndex + 1
												if switchIndex == 4 {
													switchIndex = 0
												}
												countBase = 4 * switchIndex
											}
										}
									}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
								}
							}
							Text("Symbols")
								.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
								.font(Font.DesignSystem.header)
							Text("Symbols in Play: \(symbols) ")
								.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
								.font(Font.DesignSystem.regularBody)
							ZStack {
								VStack {
									HStack(spacing: UIScreen.main.bounds.height * 0.025) {
										Image.DesignSystem.arrowBaseGray.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1, alignment: .center)
										Image.DesignSystem.blobBaseGray.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.08, alignment: .center)
										Image.DesignSystem.bowlBaseGray.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.09, height: UIScreen.main.bounds.height * 0.06, alignment: .center)
										Image.DesignSystem.circleBaseGray.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.08, alignment: .center)
									}
									HStack(spacing: UIScreen.main.bounds.height * 0.025) {
										Image.DesignSystem.diamondBaseGray.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1, alignment: .center)
										Image.DesignSystem.hourglassBaseGray.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.08, alignment: .center)
										Image.DesignSystem.pointyBaseGray.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1, alignment: .center)
										Image.DesignSystem.starBaseGray.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1, alignment: .center)
									}
								}
								VStack {
									HStack(spacing: UIScreen.main.bounds.height * 0.025) {
										Image.DesignSystem.arrowBase.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1, alignment: .center).onTapGesture {
											if !arrowOff && symbols >= 4 {
												symbols = symbols - 1
												self.arrowOff = !self.arrowOff
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
											} else if arrowOff{
												symbols = symbols + 1
												self.arrowOff = !self.arrowOff
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
											}
										}.opacity(arrowOff ? 0.1 : 1.0)
										Image.DesignSystem.blobBase.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.08, alignment: .center).onTapGesture {
											if !blobOff && symbols >= 4 {
												symbols = symbols - 1
												self.blobOff = !self.blobOff
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
											} else if blobOff {
												symbols = symbols + 1
												self.blobOff = !self.blobOff
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
											}
										}.opacity(blobOff ? 0.1 : 1.0)
										Image.DesignSystem.bowlBase.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.09, height: UIScreen.main.bounds.height * 0.06, alignment: .center).onTapGesture {
											if !bowlOff && symbols >= 4 {
												symbols = symbols - 1
												self.bowlOff = !self.bowlOff
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
											} else if bowlOff {
												symbols = symbols + 1
												self.bowlOff = !self.bowlOff
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
											}
										}.opacity(bowlOff ? 0.1 : 1.0)
										Image.DesignSystem.circleBase.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.08, alignment: .center).onTapGesture {
											if !circleOff && symbols >= 4 {
												symbols = symbols - 1
												self.circleOff = !self.circleOff
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
											} else if circleOff{
												symbols = symbols + 1
												self.circleOff = !self.circleOff
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
											}
										}.opacity(circleOff ? 0.1 : 1.0)
									}
									HStack(spacing: UIScreen.main.bounds.height * 0.025) {
										Image.DesignSystem.diamondBase.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1, alignment: .center).onTapGesture {
											if !diamondOff && symbols >= 4 {
												symbols = symbols - 1
												self.diamondOff = !self.diamondOff
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
											} else if diamondOff {
												symbols = symbols + 1
												self.diamondOff = !self.diamondOff
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
											}
										}.opacity(diamondOff ? 0.1 : 1.0)
										Image.DesignSystem.hourglassBase.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.08, alignment: .center).onTapGesture {
											if !hourglassOff && symbols >= 4 {
												symbols = symbols - 1
												self.hourglassOff = !self.hourglassOff
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
											} else if hourglassOff {
												symbols = symbols + 1
												self.hourglassOff = !self.hourglassOff
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
											}
										}.opacity(hourglassOff ? 0.2 : 1.0)
										Image.DesignSystem.pointyBase.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1, alignment: .center).onTapGesture {
											if !pointyOff && symbols >= 4 {
												symbols = symbols - 1
												self.pointyOff = !self.pointyOff
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
											} else if pointyOff {
												symbols = symbols + 1
												self.pointyOff = !self.pointyOff
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
											}
										}.opacity(pointyOff ? 0.1 : 1.0)
										Image.DesignSystem.starBase.resizable()
											.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1, alignment: .center).onTapGesture {
											if !starOff && symbols >= 4 {
												symbols = symbols - 1
												self.starOff = !self.starOff
												playSound(sound: "lowClick", type: "mp3", volume: Float(sliderProgress2))
											} else if starOff {
												symbols = symbols + 1
												self.starOff = !self.starOff
												playSound(sound: "highClick", type: "mp3", volume: Float(sliderProgress2))
											}
										}.opacity(starOff ? 0.1 : 1.0)
									}
								}
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
							.padding(.bottom, UIScreen.main.bounds.height * 0.15)
						}
					}.frame(width: UIScreen.main.bounds.width * 0.9)
				}
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
			}
		}.ignoresSafeArea()
			.navigationBarHidden(true)
		.navigationBarBackButtonHidden(true)
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
