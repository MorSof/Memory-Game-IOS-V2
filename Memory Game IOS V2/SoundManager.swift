//
//  SoundManager.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 4/29/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
    static func playSound(_ effect:SoundEffect) {
        
        var soundFilename = ""
        
        switch effect {
            
        case .flip:
            soundFilename = "cardflip"
            
        case .shuffle:
            soundFilename = "shuffle"
            
        case .match:
            soundFilename = "dingcorrect"
            
        case .nomatch:
            soundFilename = "dingwrong"
            
        }
        
        let filePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard filePath != nil else {
            print("Couldn't find sound file \(soundFilename) in the bundle")
            return
        }
        
        let soundUrl = URL(fileURLWithPath: filePath!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            audioPlayer?.play()
        }
        catch {
            print("Couldn't create the audio player object for sound file \(soundFilename)")
        }
    }
    
}
