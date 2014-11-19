//
//  AddAlarmViewController.swift
//  ARTAlarmClock
//
//  Created by Artwalk on 10/31/14.
//  Copyright (c) 2014 Artwalk. All rights reserved.
//

import UIKit

class AddAlarmViewController: UIViewController {

    let week = [1:"周一", 2:"周二", 3:"周三", 4:"周四", 5:"周五", 6:"周六", 7:"周日"]
    var weekSelected = [Int](count: 8, repeatedValue: 0)
    var date:NSDate!
    
    
    let application = UIApplication.sharedApplication()
    
    override func viewDidLoad() {
        date = datePicker.date
    }
    
    @IBOutlet weak var weekView: UIView!

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func weekBtnAction(sender: UIButton) {
        sender.selected = !sender.selected
        weekSelected[sender.tag] = sender.selected ? 1 : 0
    }
    
    @IBAction func datePickerDatePicker(sender: UIDatePicker) {
         date = sender.date
    }
    
    @IBAction func saveBarBtnAction(sender: UIBarButtonItem) {
        let ln = initLocalNotification()
        application.scheduleLocalNotification(ln)
        
        println(weekSelected)
        
        dismissSelf()
    }
    
    @IBAction func cancelBarBtnAction(sender: UIBarButtonItem) {
        dismissSelf()
    }
    
    func dismissSelf() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func initLocalNotification() -> UILocalNotification {
        var ln = UILocalNotification()
        ln.fireDate = date
        ln.timeZone = NSCalendar.currentCalendar().timeZone
        ln.alertBody = "点餐啦~~"
        ln.hasAction = true
        ln.alertAction = "去点餐"
        ln.userInfo = ["Alert":"UserAlert"]
        ln.soundName = UILocalNotificationDefaultSoundName
        ln.applicationIconBadgeNumber = 1
        
        ln.repeatInterval = NSCalendarUnit.WeekdayCalendarUnit // WeekdayCalendarUnit

        return ln
    }
    
    func registerNotification() {
        let type = UIUserNotificationType.Sound | UIUserNotificationType.Alert | UIUserNotificationType.Badge
        let uns = UIUserNotificationSettings(forTypes: type, categories: nil)
        application.registerUserNotificationSettings(uns)
    }
    
}