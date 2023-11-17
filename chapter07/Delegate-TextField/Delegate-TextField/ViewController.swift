//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by 서정원 on 11/16/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        self.tf.delegate = self
        super.viewDidLoad()
        self.tf.placeholder = "값을 입력하세요"
        self.tf.keyboardType = UIKeyboardType.alphabet              //키보드타입 영문자
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark      //키보드 색깔
        self.tf.returnKeyType = UIReturnKeyType.join                //리턴키 타입은 join
        self.tf.enablesReturnKeyAutomatically = true                //리턴키 자동 활성화 ON
        
        self.tf.becomeFirstResponder()
        
        self.tf.borderStyle = UITextField.BorderStyle.line          //테두리 스타일 - 직선
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)  //배경 색상
        self.tf.contentVerticalAlignment = .center                  //수직 방향으로 텍스트가 가운데 정렬
        self.tf.contentHorizontalAlignment = .center                //수평 방향으로 텍스트가 가운데 정렬
        self.tf.layer.borderColor = UIColor.darkGray.cgColor        //테두리 색상을 회색으로
        self.tf.layer.borderWidth = 2.0                             //테두리 두께 설정
    }
    
    @IBAction func confirm(_ sender: Any) {
        self.tf.resignFirstResponder()
    }
    @IBAction func input(_ sender: Any) {
        self.tf.becomeFirstResponder()
    }
    //텍스트 필드의 편집이 시작된 후 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 시작됩니다.")
        return true
    }
    //텍스트 필드의 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다.")
        return true
    }
    //텍스트 필드의 내용이 변경될 때
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string) 으로 바뀐다.")
        if Int(string) == nil{
            if(textField.text?.count)! + string.count > 10 {
                return false
            } else {
                return true
            }
        }
        return false
    }
    //텍스트 필드의 리턴키가 눌러졌을 때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        return true
    }
    //텍스트 필드 편집이 종료될 때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료된다")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다.")
    }
}

