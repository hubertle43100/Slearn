//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    //dictionary initlization
    let eggTimes = ["Soft": 5, "Medium": 10, "Hard": 15]
    
    //var secondsRemaining = 60
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //print(sender.currentTitle) //tells us what button we're pressing
            
        timer.invalidate() //stop it and create a new timer
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,target: self, selector: #selector(updateTimer),userInfo: nil, repeats: true) // selectors calls updateTimer every second
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime) // make sure float is not wrap the entire thing
            
            
            //print(Float(secondsPassed/totalTime))
            
            //let percentageProgress = secondsPassed / totalTime
            //progressBar.progress = Float(percentageProgress)
            //print("\(secondsRemaining) seconds.")
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
        //let results = eggTimes[hardness]!
        //print(results)

        
        
    
    //lesson: if/else
//        if hardness == "Soft"{
//            print(softTime)
//        }
//        else if hardness == "Medium"{
//            print(mediumTime)
//        }
//        else{
//            print(hardTime)
//        }
        
        //another way to do the if else statments
//        switch hardness{
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print('Error')
//        }
