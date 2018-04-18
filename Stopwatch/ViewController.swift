//
//  ViewController.swift
//  StopWatch
//
//  Created by Dakota Mathews on 3/26/18.
//  Copyright © 2018 Dakota Mathews. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(counter)
        pauseButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var counter = 0.00
    var timer = Timer()
    var isPlaying = false
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    //Start Button
    @IBAction func startTimer(_ sender: Any) {
        if(isPlaying){
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(UpdateDAKTimer), userInfo: nil, repeats: true)
        isPlaying = true

    }
    //Pause Button
    @IBAction func pauseTimer(_ sender: Any) {
       startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        
        timer.invalidate()
        isPlaying = false
    }
    // Reset Button
    @IBAction func resetTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.00
        timeLabel.text = String(counter)
    }
    
    @objc func UpdateDAKTimer(){
        counter = counter + 0.01
        timeLabel.text = String(format: "%.1f", counter)
    }
}
