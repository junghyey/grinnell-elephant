/*
 File Name: NotificationView.swift
 Used  Online Swift Playground (SwiftFiddle) for formatting the code.
 
 File Description: This file contains the singleton class for creating a notification pop up in the mac and hahndling permission.
 
 ## Components:
 - NotificationView class: singleton class for notificiaiotns pop up in the mac.
 
 ## Features:
 - Function to generate  a new notification with times

 ## References:
 https://developer.apple.com/documentation/usernotifications
 https://developer.apple.com/documentation/usernotifications/untimeintervalnotificationtrigger
 https://commitstudiogs.medium.com/how-to-implement-push-notifications-in-swift-d0f1a3caf49b
 https://developer.apple.com/documentation/usernotifications/unmutablenotificationcontent
 https://youtu.be/mIztoF9CzP8?si=-nreQJ0vAkKjscdU
 https://www.avanderlee.com/xcode/xcode-mark-line-comment/
 https://www.hackingwithswift.com/read/21/2/scheduling-notifications-unusernotificationcenter-and-unnotificationrequest
 */

import UserNotifications


//single ton class (Only one instance)
class NotificationView{
    // Purpose of singleton class: shared one instance `NotificationView` for convenient access across the app
    
    // Instantiation
    static let shared = NotificationView()
    
    
    // MARK: - requestNotificationPermission
    // ====================================================
    // Get permission from the user to display notification
    // ----------------------------------------------------
    // Called once when app luanches
    // ====================================================
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        
        // handle silently
        center.requestAuthorization(options: [.alert, .sound,.badge]){
            _,_ in
        }
        
        // following may be used for debugging:
        //        center.requestAuthorization(options: [.alert, .sound,.badge]){ granted, error in
        //            if let error = error{
        //                print("Notification Permission Error")
        //            }
        //            else{
        //                print(granted ? "Notification permission granted." : "Notification permission denied.")
        //            }
        //        }
        
    }//requestNotificationpermission()
        
        
        // MARK: - scheduleNotification
        // ====================================================
        // Function for scheduling notification
        // ----------------------------------------------------
        // Called when setting the notification with time.
        // ====================================================
        
        /*
         * ## Paramters:
         * notifyTime: how many minutes after do we notify
         * Title: title of the notification
         * Body: body of the notification.
         *
         * ## Example Usage:
         * First, request permission (say when app launches in main)
         * NotificationView.shared.requestNotificationPermission()
         * Next, schedule a notification (ex: like pomodor ends or not)
         * NotificationView.shared.scheduleNotification( notifyTime: 30, title: "Break Time", body: "Take a break")
         */
        func scheduleNotification(notifyTime minutes: TimeInterval, title: String, body: String){
            //convert minute to second
            let seconds = minutes * 60
            
            // get the content
            let content   = UNMutableNotificationContent()
            content.title = title
            content.body  = body
            content.sound = UNNotificationSound.default
            
            // triger (when to show)
            let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
            
            // request (content + trigger)
            let request = UNNotificationRequest(
                identifier: UUID().uuidString,
                content: content,
                trigger: notificationTrigger
            )
            UNUserNotificationCenter.current().add(request)
        }// scheduleNotification
        
    } //end of class

