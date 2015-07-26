//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Marta Wozniak on 26/07/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var highScoreLabel: UILabel!
    let defaults = NSUserDefaults(suiteName: "group.com.kainos.mwozniak.RockPaperScissors")!
    
    
    func updateHighScore(){
        
        if let highscore = defaults.objectForKey("highscore") as? Int {
            highScoreLabel.text = "Watch HighScore: \(highscore)"
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

