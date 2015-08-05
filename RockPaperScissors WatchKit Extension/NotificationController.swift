//
//  NotificationController.swift
//  RockPaperScissors WatchKit Extension
//
//  Created by Marta Wozniak on 26/07/15.
//  Copyright (c) 2015 Marta Wozniak. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet weak var alertLabel: WKInterfaceLabel!
    
    @IBOutlet weak var highScoreLabel: WKInterfaceLabel!
    
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        
        alertLabel.setText(localNotification.alertBody)
        if let userInfo = localNotification.userInfo as? [String:Int]{
            if let highscore = userInfo["highscore"] {
                highScoreLabel.setText("Last HighScore: \(highscore)")
            }
        }
        
        completionHandler(.Custom)
    }

    
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        
        if let highscore = remoteNotification["highscore"] as? String {
            if !highscore.isEmpty {
                highScoreLabel.setText("Last HighScore: \(highscore)")
            }
        }
        
        if let remoteAps: NSDictionary = remoteNotification["aps"] as? NSDictionary {
            if let remoteAlert: NSDictionary = remoteAps["alert"] as? NSDictionary {
                if let remoteBody = remoteAlert["body"] as? String {
                    alertLabel.setText(remoteBody)
                }
            }
        }
        
        completionHandler(.Custom)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
