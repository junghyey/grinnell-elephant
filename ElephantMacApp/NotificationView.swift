//
//  NotificationView.swift
//  Elephant
//
//  Created by Hyeyun Jung on 5/1/25.
// Handles local notification permissions and scheduling.
//https://developer.apple.com/documentation/usernotifications
// https://developer.apple.com/documentation/usernotifications/untimeintervalnotificationtrigger
//https://commitstudiogs.medium.com/how-to-implement-push-notifications-in-swift-d0f1a3caf49b
//https://developer.apple.com/documentation/usernotifications/unmutablenotificationcontent
// https://youtu.be/mIztoF9CzP8?si=-nreQJ0vAkKjscdU
import UserNotifications

//single ton class (Only one instance)
class NotificationView{
    // Shared global instance of `Notification` for convenient access across the app
    static let shared = NotificationView()
    
    // Get permission from the user to display notification
    // Typically called once when app launches
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        
        
        // handle silently
        center.requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in
                   
                }
        
        // following could be used for debugging
        
//            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//                   if let error = error {
//                       print("Notification permission error: \(error.localizedDescription)")
//                   } else {
//                       print(granted ? " Notification permission granted." : " Notification permission denied.")
//                   }
//               }
        }
    
   // function for scheduling notification
    /*
     * Paramters:
     * notifyTime: how many minutes after do we notify
     * Title: title of the notification
     * Body: body of the notification.
     *
     * Example Usage:
     * First, request permission (say ContentView.swfit -->onAppear)
     * NotificationView.shared.requestNotificationPermission()
     * Next, schedule a notification (ex: like pomodor ends or not)
     *
     * NotificationView.shared.scheduleNotification( notifyTime: 30, title: "Break Time", body: "Take a break")
     */
    func scheduleNotification(notifyTime minutes: TimeInterval, title: String, body: String){
        let seconds = minutes * 60
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        
        let request = UNNotificationRequest(
                identifier: UUID().uuidString,
                content: content,
                trigger: notificationTrigger
            )
        UNUserNotificationCenter.current().add(request)
        
//        UNUserNotificationCenter.current().add(request) { error in
//               if let error = error {
//                   print("Error scheduling notification: \(error.localizedDescription)")
//               } else {
//                   print("Notification scheduled for \(minutes) minute(s).")
//               }
//           }
    }// scheduleNotification
    
    
}
