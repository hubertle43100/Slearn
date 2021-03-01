//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

/*
 IMPORTANT: look up definition by hitting OPTION KEY and CLICKING
 */

class ViewController: UIViewController {
    
    var player: AVAudioPlayer? //AVAudio.. is used to access sound file

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) { //called when someone tap or press the button
        //print(sender.currentTitle) //sender tells us about the button property
        // testing with --> print("I got pressed")
        sender.alpha = 0.5
        
        //Code should execute after 0.5 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        playSound(soundName: sender.currentTitle!) // "!" = optional
    }
    
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
//    func playSound() {
//        //Bundle is looking for url(resource)
//        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }
//
//        do {
//            try
//                //AVAudioSession = category of playing sound is curcial for app
//                //purple parts kinda have to look up
//                AVAudioSession.sharedInstance().setCategory(.playback , mode: .default)
//            //play sound even on silent
//            try AVAudioSession.sharedInstance().setActive(true)
//
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//            guard let player = player else { return }
//
//            player.play()
//
//        } catch let error { //catching errors
//            print(error.localizedDescription)
//        }
//    }
    

}

