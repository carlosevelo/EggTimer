//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeDictionary = ["Soft": 5.0, "Medium": 7.0, "Hard": 12.0]
    var timer = Timer()

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        let seconds = timeDictionary[hardness]!
        timeLabel.text = hardness
        
        startTimer(totalSeconds: seconds)
    }

    func startTimer(totalSeconds: Double) {
        var secondsPassed = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            if secondsPassed < totalSeconds {
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed/totalSeconds)
            }
            else {
                timer.invalidate()
                timeLabel.text = "Done!"
                progressBar.progress = 1.0
            }
        }
    }
    
}
