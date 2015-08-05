//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Marta Wozniak on 26/07/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var highscorefromdefaults: Int = 0
    
    @IBOutlet weak var highScoreLabel: UILabel!
    let defaults = NSUserDefaults(suiteName: "group.com.kainos.mwozniak.RockPaperScissors")!
    
    
    
    @IBAction func resetHighScore() {
        
        var notification = UILocalNotification()
        
        notification.alertBody = "From iPhone!"
        notification.fireDate = NSDate().dateByAddingTimeInterval(NSTimeInterval(10))
        updateHighScore()
        notification.userInfo = ["highscore" : highscorefromdefaults]
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.category = "gameCategory"
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        defaults.setInteger(0, forKey: "highscore")
        updateHighScore()

    }
    
    func updateHighScore(){
        
        if let highscore = defaults.objectForKey("highscore") as? Int {
            highScoreLabel.text = "Watch HighScore: \(highscore)"
            highscorefromdefaults = highscore
        } else {
            highScoreLabel.text = "No HighScore yet!"
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        updateHighScore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

