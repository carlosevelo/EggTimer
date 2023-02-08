//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeDictionary = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        var seconds = timeDictionary[hardness]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            if seconds > 0 {
                print(seconds)
                seconds -= 1
            }
            else {
                timer.invalidate()
                timeLabel.text = "Done!"
            }
        }

    }
    
}
