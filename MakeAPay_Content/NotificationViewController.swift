//
//  NotificationViewController.swift
//  MakeAPay_Content
//
//  Created by Tyler J Schultz on 9/22/16.
//  Copyright © 2016 Tyler J Schultz. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import TestFramework


class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var paymentAmountLabel: UILabel!
    @IBOutlet weak var paymentDueDate: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var card: TSView!
    @IBOutlet weak var cardUpperLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
        
       
        animate(view: paymentAmountLabel, delay: 0.3)
        animate(view: paymentDueDate, delay: 0.35)
        animate(view: cardNumber, delay: 0.4)
//        animate(view: cardImage, delay: 0.45)
        

    }
    
    
    func didReceive(_ notification: UNNotification) {
        
        let e = HandleNotification()
        e.handleSingleNotif()
    }
//
    func animate(view : UILabel, delay : Double) {
        view.alpha = 0.0
        UIView.animate(withDuration: 0.2, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: [.curveEaseInOut], animations: {
            view.alpha = 1.0
            }, completion: nil)
    }
}
