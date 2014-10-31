//
//  AddAlarmViewController.swift
//  ARTAlarmClock
//
//  Created by Artwalk on 10/31/14.
//  Copyright (c) 2014 Artwalk. All rights reserved.
//

import UIKit

class AddAlarmViewController: UIViewController {

    let week = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
    
    override func viewDidLoad() {
        
    }
    
    @IBOutlet weak var weekView: UIView!

    @IBAction func weekBtnAction(sender: UIButton) {
        
//        println("\(sender.tag)")
        
        if sender.selected {
            // save
        } else {
            // remove
        }
        
        sender.selected = !sender.selected
    }
    
    @IBAction func saveBarBtnAction(sender: UIBarButtonItem) {
        
    }
    
    @IBAction func cancelBarBtnAction(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}