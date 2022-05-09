//
//  CardView.swift
//  shout
//
//  Created by Zachary Fertig on 4/2/22.
//

import SwiftUI
import DesignSystem

struct CardView: View {
	@AppStorage("switchTime") var switchTime = 5
	@AppStorage("dark") var dark:Bool = false
	@AppStorage("auto") var auto:Bool = true
	@AppStorage("manual") var manual:Bool = false
	@AppStorage("blind") var blind:Bool = false
	@AppStorage("sliderProgress2") var sliderProgress2 = 1.0
	
	@ObservedObject var shout: Shout
	
	@State var start = true
	
	@State var isPlaying = true
	@State var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
	
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	var body: some View {
		ZStack {
			//playSound(sound: "tick5", type: "mp3")
			if auto {
				Text("")
					.onReceive(self.timer) { time in
						print(shout.cat.getCount())
						if start {
							UIApplication.shared.isIdleTimerDisabled = true
							self.timer = Timer.publish(every: TimeInterval(switchTime), on: .main, in: .common).autoconnect()
							shout.reset()
							start = false
						}
						playSound(sound: "dingTick", type: "mp3", volume: Float(sliderProgress2))
						shout.new()
					}
			}
			if dark {
				Color.DesignSystem.backgroundDark.ignoresSafeArea()
			} else {
				Color.DesignSystem.background.ignoresSafeArea()
			}
			VStack {
				if isPlaying {
					Image.DesignSystem.pause.resizable()
						.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1)
						.onTapGesture {
						 if isPlaying {
							 self.timer.upstream.connect().cancel()
							 UIApplication.shared.isIdleTimerDisabled = false
						 } else {
							 UIApplication.shared.isIdleTimerDisabled = true
							 self.timer = Timer.publish(every: TimeInterval(switchTime), on: .main, in: .common).autoconnect()
						 }
						 isPlaying = !isPlaying
					 }
				} else {
					Image.DesignSystem.playSmall.resizable()
						.frame(width: UIScreen.main.bounds.height * 0.1, height: UIScreen.main.bounds.height * 0.1)
						.onTapGesture {
						 if isPlaying {
							 self.timer.upstream.connect().cancel()
							 UIApplication.shared.isIdleTimerDisabled = false
						 } else {
							 UIApplication.shared.isIdleTimerDisabled = true
							 self.timer = Timer.publish(every: TimeInterval(switchTime), on: .main, in: .common).autoconnect()
						 }
						 isPlaying = !isPlaying
					 }
				}
			}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
				.padding(.top, UIScreen.main.bounds.height * 0.05)
			VStack {
				Text(shout.category).font(Font.DesignSystem.card).multilineTextAlignment(.center).rotationEffect(Angle(degrees: 180)).padding().foregroundColor(Color.DesignSystem.primary)
			}.padding(.top, UIScreen.main.bounds.height * 0.14).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
			VStack {
				ZStack {
					Image(shout.symbol)
					if blind && !start && !shout.isSwapping{
						Text("\(shout.sym.number)").font(Font.DesignSystem.title)
					}
				}
			}
			VStack {
				Text(shout.category).font(Font.DesignSystem.card).multilineTextAlignment(.center).padding().foregroundColor(Color.DesignSystem.primary)
			}.padding(.bottom, UIScreen.main.bounds.height * 0.14).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
			
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
						self.timer.upstream.connect().cancel()
						shout.reset()
						start = true
						UIApplication.shared.isIdleTimerDisabled = false
						presentationMode.wrappedValue.dismiss()
					}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
			}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
			if manual {
				ZStack {
					Image.DesignSystem.next.resizable()
						.frame(width: UIScreen.main.bounds.height * 0.145, height: UIScreen.main.bounds.height * 0.058, alignment: .trailing)
						.padding(.trailing, UIScreen.main.bounds.width * 0.05)
					 .padding(.bottom, UIScreen.main.bounds.width * 0.05)
						.onTapGesture {
						if start {
							playSound(sound: "dingTick", type: "mp3", volume: Float(sliderProgress2))
							shout.reset()
							start = false
						}
						playSound(sound: "dingTick", type: "mp3", volume: Float(sliderProgress2))
						shout.new()
					}
				}.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
			}
		}.ignoresSafeArea()
			.navigationBarHidden(true)
			.navigationBarBackButtonHidden(true)
	}
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(shout: Shout())
    }
}
