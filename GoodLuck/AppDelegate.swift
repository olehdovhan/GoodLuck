//
//  AppDelegate.swift
//  GoodLuck
//
//  Created by Oleh Dovhan on 18.07.2021.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  let notificationCenter = UNUserNotificationCenter.current()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
 
    notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
      guard granted else { return }
      self.notificationCenter.getNotificationSettings { settings in
        print(settings)
        guard settings.authorizationStatus == .authorized else { return }
      }
    }
    notificationCenter.delegate = self
    sendNotifications()
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }

  func sendNotifications() {
    
    let content = UNMutableNotificationContent()
    content.title = "Prototype title notification"
    content.body = " As you see I can install notifications in apps!!!!!!!"
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
    
    let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
    
    notificationCenter.add(request) { (error) in
      print(error?.localizedDescription)
    }
  }
  
}

extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.banner, .badge, .sound])
    print(#function)
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    print(#function)
  }
  
}

