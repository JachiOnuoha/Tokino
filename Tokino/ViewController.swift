//
//  ViewController.swift
//  Tokino
//
//  Created by Jachimike Onuoha on 7/5/19.
//  Copyright © 2019 Jachimike Onuoha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Button Outlets
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    // Timer Logic
    var timer = Timer()
    var isRunning = false
    var counter = 0.0
    
    //Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isEnabled = false
        stopButton.isEnabled = false
        startButton.isEnabled = true
    }
    //Button actions
    @IBAction func resetDidTap(_ sender: Any)
    {
        timer.invalidate()
        isRunning = false
        counter = 0.0
        timerLabel.text = "00:00:00"
        resetButton.isEnabled = false
        stopButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    @IBAction func startDidTap(_ sender: Any)
    {
        if !isRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isRunning = true
            resetButton.isEnabled = true
            stopButton.isEnabled = true
            startButton.isEnabled = false
        }
    }
    
    
    @IBAction func stopDidTap(_ sender: Any)
    {
        resetButton.isEnabled = true
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        isRunning = false
        timer.invalidate()
    }
    
    // Functions provided by the tutorial
    @objc func runTimer(){
        counter += 0.1
        timerLabel.text = "\(counter)"
        let flooredCounter = Int(floor(counter))
        
        let hour = flooredCounter / 3600
        var hourString = "\(hour)"
        if hour < 10
        {
            hourString = "0\(hour)"
        }
       
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10{
            minuteString = "0\(minute)"
        }
        
        let seconds = (flooredCounter % 3600) % 60
        var secondString = "\(seconds)"
        if seconds < 10{
            secondString = "0\(seconds)"
        }
        
        timerLabel.text = "\(hourString):\(minuteString):\(secondString)"
    }
}

