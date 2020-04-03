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
    
//    //constants for the different timers
//    let softTime = 5
//    let medTime = 8
//    let hardTime = 12
    
    //dictionary; "key" : "value"
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    
   // var result: Int = 0
    
    //initializer for Timer instance that is stored in timer
    var timer = Timer()
    
    
   // var ratio: Float = 0
    
    let hardnessSelector: String = "Soft"
    
    //number of total seconds
    var totalTime: Float = 0
    //number of elapsed seconds
    var secondsPassed: Float = 0
    
    var player: AVAudioPlayer!
    
    var hardness: String = ""
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //begin classwork - inefficient if/else statement
        
       //let hardness = sender.currentTitle!
        
//        if (hardnessSelector == "Soft"){
//            print("soft button pressed")
//            totalTime = 3
//        }
//        else if (hardnessSelector == "Medium"){
//            print("medium button pressd")
//            totalTime = 5
//        }
//        else if (hardnessSelector == "Hard"){
//            print("hard button pressed")
//            totalTime = 7
//        }
        
   //     print("The ", sender.titleLabel!.text!, " button was pressed" )
        
        
        //end classwork

        //this will change from "done" when the timer elapses
        //this is the default String value
        self.titleLabel.text = "How do you like your eggs?"
        //resets the timer
        timer.invalidate()
        //ProgressView default to 0
        labelProgress.progress = 0
        //elapsed seconds
        secondsPassed = 0
        //total amount of seconds
        totalTime = 0
        
        //stores the currentTitle of the button pressed (so we know which button was pressed) in a constant
        hardness = sender.currentTitle!
        print(hardness)
        //uses the currentTitle as a key in the dict
        //cast it as a Float
        //why? because totalTime was declared as a float. We'll be dividing this number, so likely we'll have remainders
        totalTime = Float(eggTimes[hardness]!)
        //eggTimes - dict
        //hardness - String (title label of the button)
        //dict[String/key]

        //Timer() was initialized and stored in timer.
        //selector is the function we'll be passing to
        //timeInterval is the number of seconds between calling it again
        //repeats is a boolean. True it repeats, false it doesn't repeat (one and done)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
 
    }
    
    // must be internal or public.
       @objc func timerAction() {
           
        if (totalTime > 0){
            
            self.titleLabel.text = String(totalTime)
            //self.titleLabel.text = hardness
            totalTime = totalTime - 1
        }
        
        else{
         
            self.titleLabel.text = "DONE!"
            playSound(label: "alarm_sound")
            
        }
        }
        
                 
       
    
    func playSound(label : String) {
        let url = Bundle.main.url(forResource: label, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    @IBOutlet weak var labelProgress: UIProgressView!
    
    @IBOutlet weak var progressLabel: UIView!
    
   
   
}
