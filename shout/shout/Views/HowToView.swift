//
//  HowTo.swift
//  shout
//
//  Created by Zachary Fertig on 4/1/22.
//

import SwiftUI
import DesignSystem

struct HowToView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@AppStorage("dark") var dark:Bool = false
	@AppStorage("sliderProgress2") var sliderProgress2 = 1.0
	
	@State var step = 1
    var body: some View {
		//ZS
		ZStack {
			if dark {
				Color.DesignSystem.backgroundDark.ignoresSafeArea()
			} else {
				Color.DesignSystem.background.ignoresSafeArea()
			}
			//VS -1
			VStack(spacing: UIScreen.main.bounds.height * 0.05) {
				//VS 0
				VStack(spacing: UIScreen.main.bounds.height * 0.05) {
					VStack(spacing: UIScreen.main.bounds.height * 0.01) {
						Image.DesignSystem.howToTitle.resizable()
							.frame(width: UIScreen.main.bounds.height * 0.28, height: UIScreen.main.bounds.height * 0.19, alignment: .center)
						Rectangle().fill(Color.DesignSystem.primary).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
					}.padding(.top, UIScreen.main.bounds.height * 0.05)
					//GR
					GeometryReader { gp in
						//HS
						HStack {
							//VS1
							VStack(spacing: UIScreen.main.bounds.height * 0.02) {
								Text("Intro")
									.font(Font.DesignSystem.header)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
								Text("Shout! is a game of speed recall for 3 to 8 players.")
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
									.multilineTextAlignment(.center)
								Text("To play, all you need is the Shout! app and our special set of tokens.")
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
									.multilineTextAlignment(.center)
								Link("Extended Rules", destination: URL(string: "https://adf02741-b39a-401d-8a74-f0352e43aea2.usrfiles.com/ugd/adf027_29d777a8cffa442caf2d0944ccfef225.pdf")!)
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(.blue)
								Link("Papercraft Pieces", destination: URL(string: "https://static.wixstatic.com/media/adf027_d7dad8b242ba47f2a000dcb86f15920c~mv2.png")!)
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(.blue)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
								.padding(.leading, UIScreen.main.bounds.height * 0.04).frame(width: gp.frame(in: .global).width * 0.9)
							//End VS1
							//VS2
							VStack(spacing: UIScreen.main.bounds.height * 0.02) {
								Text("Setup")
									.font(Font.DesignSystem.header)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
								Text("Everyone gets a token with one of 6 unique symbols and colors.")
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
									.multilineTextAlignment(.center)
								Text("All players should also have up to 10 point tokens. Keep these on your left.")
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
									.multilineTextAlignment(.center)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
								.padding(.leading, UIScreen.main.bounds.height * 0.07).frame(width: gp.frame(in: .global).width)
							//End VS2
							//VS3
							VStack(spacing: UIScreen.main.bounds.height * 0.02) {
								Text("Rules")
									.font(Font.DesignSystem.header)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
								Text("Every card flipped in this app will have a colored symbol and a category.")
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
									.multilineTextAlignment(.center)
								HStack{
									Image.DesignSystem.cardSmall.resizable().frame(width: UIScreen.main.bounds.height * 0.15, height: UIScreen.main.bounds.height * 0.25)
									VStack{
										Image.DesignSystem.diamond1Small.resizable().frame(width: UIScreen.main.bounds.height * 0.13, height: UIScreen.main.bounds.height * 0.13)
										Image.DesignSystem.hourglass4Small.resizable().frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1)
									}
								}
									.font(Font.DesignSystem.bigBody)
									.multilineTextAlignment(.center)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
								.padding(.leading, UIScreen.main.bounds.height * 0.07).frame(width: gp.frame(in: .global).width)
							//End VS3
							//VS4
							VStack(spacing: UIScreen.main.bounds.height * 0.02) {
								Text("Gameplay")
									.font(Font.DesignSystem.header)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
								Text("If the symbol or color on your token matches that of the card, shout an example of the category before your opponents to receive a point! First to move all of their point tokens to the right wins!")
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
									.multilineTextAlignment(.center)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
								.padding(.leading, UIScreen.main.bounds.height * 0.03).frame(width: gp.frame(in: .global).width)
							VStack(spacing: UIScreen.main.bounds.height * 0.02) {
								Text("Let's Play")
									.font(Font.DesignSystem.header)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
								Text("Change the token types depending on the number of players and have fun!")
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
									.multilineTextAlignment(.center)
								Text("Now Let's Go!")
									.font(Font.DesignSystem.bigBody)
									.foregroundColor(dark ? Color.DesignSystem.white : Color.DesignSystem.body)
									.multilineTextAlignment(.center)
								Image.DesignSystem.playSmall.resizable()
									.frame(width: UIScreen.main.bounds.height * 0.2, height: UIScreen.main.bounds.height * 0.2)
									.onTapGesture {
									playSound(sound: "ding", type: "mp3", volume: Float(sliderProgress2))
									presentationMode.wrappedValue.dismiss()
								}.transition(.opacity)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
								.padding(.leading, UIScreen.main.bounds.height * 0.01).frame(width: gp.frame(in: .global).width)
							//End VS4
						}.frame(width: gp.frame(in: .global).width * 5)
							.offset(x: step == 1 ? 0
									: step == 2 ? -gp.frame(in: .global).width
									: step == 3 ? -gp.frame(in: .global).width * 2
									: step == 4 ? -gp.frame(in: .global).width * 3
									: -gp.frame(in: .global).width * 4)
							.animation(Animation.interpolatingSpring(stiffness: 50, damping: 10))
						//End HS
					}
					//End GR
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
				//End VS0
				//Begin Ifs
			}
				VStack {
					if step == 1 {
						HStack() {
							VStack {
								Image.DesignSystem.leftArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.leading, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.opacity(0)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
							VStack {
								Image.DesignSystem.page1.resizable().frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.06)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
								.padding(.bottom, UIScreen.main.bounds.width * 0.035)
							VStack {
								Image.DesignSystem.rightArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.trailing, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.onTapGesture {
									playSound(sound: "clickOn", type: "mp3", volume: Float(sliderProgress2))
									self.step = self.step + 1
								}
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
						}
					}
					else if step == 2 {
						HStack() {
							VStack {
								Image.DesignSystem.leftArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.leading, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.onTapGesture {
									playSound(sound: "clickOff", type: "mp3", volume: Float(sliderProgress2))
									self.step = self.step - 1
								}
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
							VStack {
								Image.DesignSystem.page2.resizable().frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.06)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
								.padding(.bottom, UIScreen.main.bounds.width * 0.035)
							VStack {
								Image.DesignSystem.rightArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.trailing, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.onTapGesture {
									playSound(sound: "clickOn", type: "mp3", volume: Float(sliderProgress2))
									self.step = self.step + 1
								}
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
						}
					}
					else if step == 3 {
						HStack() {
							VStack {
								Image.DesignSystem.leftArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.leading, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.onTapGesture {
									playSound(sound: "clickOff", type: "mp3", volume: Float(sliderProgress2))
									self.step = self.step - 1
								}
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
							VStack {
								Image.DesignSystem.page3.resizable().frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.06)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
								.padding(.bottom, UIScreen.main.bounds.width * 0.035)
							VStack {
								Image.DesignSystem.rightArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.trailing, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.onTapGesture {
									playSound(sound: "clickOn", type: "mp3", volume: Float(sliderProgress2))
									self.step = self.step + 1
								}
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
						}
					}
					else if step == 4 {
						HStack() {
							VStack {
								Image.DesignSystem.leftArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.leading, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.onTapGesture {
									playSound(sound: "clickOff", type: "mp3", volume: Float(sliderProgress2))
									self.step = self.step - 1
								}
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
							VStack {
								Image.DesignSystem.page4.resizable().frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.06)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
								.padding(.bottom, UIScreen.main.bounds.width * 0.035)
							VStack {
								Image.DesignSystem.rightArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.trailing, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.onTapGesture {
									playSound(sound: "clickOn", type: "mp3", volume: Float(sliderProgress2))
									self.step = self.step + 1
								}
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
						}
					}
					else if step == 5 {
						HStack() {
							VStack {
								Image.DesignSystem.leftArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.leading, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.onTapGesture {
									playSound(sound: "clickOff", type: "mp3", volume: Float(sliderProgress2))
									self.step = self.step - 1
								}
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
							VStack {
								Image.DesignSystem.page5.resizable().frame(width: UIScreen.main.bounds.height * 0.08, height: UIScreen.main.bounds.height * 0.06)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
								.padding(.bottom, UIScreen.main.bounds.width * 0.035)
							VStack {
								Image.DesignSystem.rightArrow.resizable().frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
									.padding(.trailing, UIScreen.main.bounds.width * 0.05)
									.padding(.bottom, UIScreen.main.bounds.width * 0.05)
									.opacity(0)
							}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
						}
					}
					Rectangle().fill(Color.DesignSystem.primary).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.01)
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
				//End Ifs
			
			//End VS-1
		}.ignoresSafeArea()
			.navigationBarHidden(true)
			.navigationBarBackButtonHidden(true)
		//End ZS
	}
	//End View
}
//End Struct

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
		HowToView()
    }
}
