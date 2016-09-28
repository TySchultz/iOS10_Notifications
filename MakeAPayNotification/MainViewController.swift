//
//  MainViewController.swift
//  MakeAPayNotification
//
//  Created by Tyler J Schultz on 9/22/16.
//  Copyright © 2016 Tyler J Schultz. All rights reserved.
//

import UIKit
import UserNotifications
import TestFramework
class MainViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func launchNotification(sender: UIButton) {
        
        let content : UNMutableNotificationContent = UNMutableNotificationContent()
        content.title = "Payment Due"
        content.body = "Your payment for policy #23982498 is due 9/23/16"
        content.sound = UNNotificationSound.default()
        content.badge = UIApplication.shared.applicationIconBadgeNumber.advanced(by: 1) as NSNumber?
        content.categoryIdentifier = "MakeAPay_Content"
        
        setActions()
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 3.0, repeats: false)
        
        let iD = "MakeAPay_Content"
     
        let request = UNNotificationRequest.init(identifier: iD, content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        
        center.add(request) { (Error) in
            guard (Error == nil) else { print("There was an Error"); return}
            print("Recieved the notification request")
        }
        
        HandleNotification().handleSingleNotif()
    }
    
    
 
    
    
    func setActions() {
        let pusherWeb = UNNotificationAction(
            identifier: "pusher-web",
            title: "Make Payment",
            options: [.authenticationRequired]
        )
        let dismiss = UNNotificationAction(
            identifier: "dismiss",
            title: "Dismiss",
            options: [.destructive]
        )
        let category = UNNotificationCategory(identifier: "MakeAPay_Content", actions: [pusherWeb, dismiss], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
}
