//
//  Audio.swift
//  shout
//
//  Created by Zachary Fertig on 4/4/22.
//

import AVFoundation
import SwiftUI

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String, volume: Float) {
	if let path = Bundle.main.path(forResource: sound, ofType: type) {
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
			audioPlayer?.numberOfLoops = 0
			audioPlayer?.setVolume(volume, fadeDuration: 0.5)
			audioPlayer?.prepareToPlay()
			audioPlayer?.play()
		} catch {
			print("ERROR: file cannot be found")
		}
	}
}

func playInf(sound: String, type: String, volume: Float) {
	if let path = Bundle.main.path(forResource: sound, ofType: type) {
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
			audioPlayer?.numberOfLoops = -1
			audioPlayer?.setVolume(volume, fadeDuration: 0.5)
			audioPlayer?.prepareToPlay()
			audioPlayer?.play()
		} catch {
			print("ERROR: file cannot be found")
		}
	}
}
