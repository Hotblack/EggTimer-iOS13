//
//  TimerSelect.swift
//  EggTimer
//
//  Created by Adam Jackrel on 3/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

//this will be an instance of TimerSelect struct
//we'll use this for our timer app
//each instance of this struct will be instantiated when a user presses the button
struct TimerSelect{
    
    //Total time remaining
    var time : Int
    //the button selected
    var selector : String
    
    //initializing the above fields
    //similiar to a constructor in other OOP languages
    init(time : Int, selector: String) {
        
        //need to assign the passed arguments to the fields in the instance of the struct
        self.time = time
        self.selector = selector
        
    }
    
    
    
}
