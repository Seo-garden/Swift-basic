//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by 서정원 on 11/14/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBOutlet var result: UILabel!
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        let ok = UIAlertAction(title : "확인", style: .default) { (_) in
            self.result.text = "확인버튼을 클릭했습니다."
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)  { (_) in
            self.result.text = "취소버튼을 클릭했습니다."
        }
        let exec = UIAlertAction(title : "실행", style: .destructive)  { (_) in
            self.result.text = "실행버튼을 클릭했습니다."
        }
        let stop = UIAlertAction(title: "중지", style: .default)  { (_) in
            self.result.text = "중지버튼을 클릭했습니다."
        }
        
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let message = "사용자의 Apple ID indian4589@naver.com 의 암호를 입력하시오"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            if let tf = alert.textFields?[0] {
                print("입력된 값은 \(tf.text!) 입니다.")
            } else {
                print("입력된 값이 없습니다.")
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true
        })
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: false)
    }
    
    @IBAction func auth(_ sender: Any) {
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: {(_) in
            let loginID = alert.textFields?[0].text
            let loginPW = alert.textFields?[1].text
            
            if loginID == "sqlpro" && loginPW == "1234"{
                self.result.text = "인증됨"
            } else {
                self.result.text = "인증안됨"
            }
        })
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "아이디"      // 미리 보여줄 안내 메시지
            tf.isSecureTextEntry = false //입력 시 별표(*) 처리 안함
        })
        alert.addTextField(configurationHandler: {(tf) in
            tf.placeholder = "비밀번호"      // 미리 보여줄 안내 메시지
            tf.isSecureTextEntry = true //입력 시 별표(*) 처리 안함
        })
        self.present(alert, animated: false)
    }
}
