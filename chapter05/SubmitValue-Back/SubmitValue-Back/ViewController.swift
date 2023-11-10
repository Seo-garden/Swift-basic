//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by 서정원 on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultInterval: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultEmail: UILabel!
    
    var paramEmail : String?    //이메일 값을 전달받은 속성
    var paramUpdate : Bool?     //자동 갱신 여부를 전달받은 속성
    var paramInterval : Double? //갱신주기 값을 전달받은 속성
    
    override func viewWillAppear(_ animated: Bool) {
        if let email = paramEmail {
            resultEmail.text = email
        }
        if let update = paramUpdate {
            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        }
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))" + "분마다"
        }
    }
    
}
