//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by 서정원 on 11/15/23.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate{

    //앱이 처음 실행됐을 때 실행되는 메소드
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 17.0, *){
            let notiCenter = UNUserNotificationCenter.current()
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]){(didAllow, e) in}
            notiCenter.delegate = self      //알림 센터와 관련하여 뭔가 사건이 발생하면 나(앱 델리게이트) 한테 알려줘!
        }
        return true
    }
    //사용자가 허용 버튼을 클릭했을 경우 getNotificationSettings() 메소드의 인자값 클로저에 전달
    func applicationWillResignActive(_ application: UIApplication) {
        if #available(iOS 17.0, *){
            UNUserNotificationCenter.current().getNotificationSettings{ settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    //1. 발송할 내용을 정의하기 위한 객체 생성
                    let nContent = UNMutableNotificationContent()
                    //2. 발송 조건을 정의
                    nContent.badge = 1
                    //3. 알림 요청을 만드는
                    nContent.title = "로컬 알림 메시지"
                    nContent.subtitle = "준비된 내용이 아주 많아요 ! 얼른 앱을 실행시켜 주세요!"
                    nContent.body = "앗 왜 나갔어요 ! "
                    nContent.sound = UNNotificationSound.default
                    //4.
                    nContent.userInfo = ["name" : "홍길동"]
                    // 2초 뒤에 알림을 발송하되, 반복하지마라
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: true)
                    //알림 요청 객체
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                } else {
                    print("사용자가 동의하지 않음!")
                }
            }
        }
    }
    //앱 실행 도중에 알림 메시지가 도착한 경우
    @available(iOS 17.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "wakeup" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler([.alert, .badge, .sound])     //생략 시 앱 실행 도중에 알림 배너가 표시되지 않음.
    }
    //사용자가 알림 메시지를 클릭했을 경우
    @available(iOS 17.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup" {
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler()
    }
    
    
    
    
    
    
    
    
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


}

