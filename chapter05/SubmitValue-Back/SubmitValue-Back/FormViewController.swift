//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 서정원 on 11/11/23.
//

import Foundation
import UIKit

class FormViewController : UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!

    @IBAction func onSubmit(_ sender: Any) {
        let ud = UserDefaults.standard          //UserDefaults 객체의 인스턴스를 가져온다
        
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
//        let ad = UIApplication.shared.delegate as? AppDelegate  //AppDelegate 객체의 인스턴스를 가져온다.
//        
//        ad?.paramEmail = self.email.text
//        ad?.paramUpdate = self.isUpdate.isOn
//        ad?.paramInterval = self.interval.value
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ViewController else { return }
//        
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
//
        self.presentingViewController?.dismiss(animated: true)
    }
}
