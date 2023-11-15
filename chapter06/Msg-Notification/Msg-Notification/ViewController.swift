//
//  ViewController.swift
//  Msg-Notification
//
//  Created by 서정원 on 11/15/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var msg: UITextField!
    @IBOutlet var datepicker: UIDatePicker!
    
    @IBAction func save(_ sender: Any) {
        if #available(iOS 17.0, *){
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    DispatchQueue.main.async {
                        let nContent = UNMutableNotificationContent()
                        nContent.body = (self.msg.text)!
                        nContent.title = "미리 알림"
                        nContent.sound = UNNotificationSound.default
                        
                        let time = self.datepicker.date.timeIntervalSinceNow
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        
                        let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request)
                    }
                } else {
                    let alert = UIAlertController(title: "알람 등록", message: "알람이 허용되어 있지 않습니다.", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false)
                }
            }
        } else {}
    }
}

