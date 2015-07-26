//
//  GameStatController.swift
//  RockPaperScissors
//
//  Created by Marta Wozniak on 26/07/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import Foundation
import WatchKit

class GameStatController: WKInterfaceController {
    
    @IBOutlet weak var currentScoreLabel: WKInterfaceLabel!
    
    @IBOutlet weak var highScoreLabel: WKInterfaceLabel!
    
    @IBOutlet weak var gamesPlayedLabel: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        
        if let input = context as? [String:String],
            score = input["currentScore"],
            highScore = input["highScore"],
            gamesPlayed = input["gamesPlayed"] {
                currentScoreLabel.setText(score)
                highScoreLabel.setText(highScore)
                gamesPlayedLabel.setText(gamesPlayed)
        }
    }
    
}
