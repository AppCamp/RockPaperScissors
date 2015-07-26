//
//  InterfaceController.swift
//  RockPaperScissors WatchKit Extension
//
//  Created by Marta Wozniak on 26/07/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    @IBOutlet weak var scoreLabel: WKInterfaceLabel!
    @IBOutlet weak var oponentSymbol: WKInterfaceImage!
    
    let defaults = NSUserDefaults(suiteName: "group.com.kainos.mwozniak.RockPaperScissors")!
    
    var score = 0
    var gamesCounter = 0
    var highscore = 0
    let symbols = ["rock","paper","scissors"]
    
    
    @IBAction func chooseRock() {
        play("rock")
    }
    @IBAction func choosePaper() {
        play("paper")
    }
    @IBAction func chooseScissors() {
        play("scissors")
    }
    
    @IBAction func showGameStats() {
        highscore = getHighScoreFromDefaults()
        
        pushControllerWithName("GameStats", context: ["currentScore": "\(score)", "highScore": "\(highscore)", "gamesPlayed": "\(gamesCounter)"])
    }
    
    
    func play(symbol: String) {
        gamesCounter += 1
        
        let oponentPick = symbols[Int(arc4random_uniform(3))]
        oponentSymbol.setImage(UIImage(named: oponentPick))
        
        if oponentPick == symbol {
            resultLabel.setText("Tie. +1")
            score += 1
        } else {
            var won = false
            
            switch symbol{
                case "rock":
                    if oponentPick == "scissors" {
                        won = true
                }
                case "paper":
                    if oponentPick == "rock" {
                        won = true
                }
                case "scissors":
                    if oponentPick == "paper" {
                        won = true
                }
            default: resultLabel.setText("Unrecognized symbol")
            }
            
            if won {
                resultLabel.setText("You won! +5")
                score += 5
            } else {
                resultLabel.setText("You lost. -2")
                score -= 2
            }
            
        }
        
        scoreLabel.setText("\(score)")
        updateHighScore()
    }
    
    func getHighScoreFromDefaults() -> Int {
        var highScoreFromDefaults = defaults.objectForKey("highscore") as? Int
        
        return (highScoreFromDefaults != nil) ? highScoreFromDefaults! : 0
    }
    
    func updateHighScore(){
        highscore = getHighScoreFromDefaults()
        
        if (score > highscore) {
            defaults.setObject(score, forKey: "highscore")
            defaults.synchronize()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}




