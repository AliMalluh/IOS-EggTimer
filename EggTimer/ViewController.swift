//
//  ViewController.swift
//  EggTimer
//
//  Created by Ali-Malluh on 24/10/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 3, "Medium": 420, "Hard": 720]
    
    var totalTime = 0
    var secondsPassed = 0
     
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLable: UILabel!

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLable.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress  = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLable.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }

}
