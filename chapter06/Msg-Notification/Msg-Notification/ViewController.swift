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
                    DispatchQueue.main.async {      //UI업데이트와 같은 작업을 실행한다.
                        //알림 콘텐츠 정의
                        let nContent = UNMutableNotificationContent()
                        nContent.body = (self.msg.text)!        //값이 옵셔널 타입으로 존재하지 않을 수 있기 때문에 ! 강제 언래핑을 한다.
                        nContent.title = "미리 알림"
                        nContent.sound = UNNotificationSound.default
                        //발송 시각을 *초 형식으로 변환
                        let time = self.datepicker.date.timeIntervalSinceNow
                        //발송 조건 정의
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                        
                        let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request){ (_) in
                            DispatchQueue.main.async {
                                let date = self.datepicker.date.addingTimeInterval(9*60*60)
                                let message = "알림이 등록되었습니다. 등록된 알림은 \(date) 에 발송됩니다."
                                let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                                let ok = UIAlertAction(title: "확인", style: .default)
                                alert.addAction(ok)
                                self.present(alert, animated: false)
                                
                            }
                        }
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

