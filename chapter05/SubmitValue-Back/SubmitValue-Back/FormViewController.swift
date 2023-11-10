//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 서정원 on 11/10/23.
//

import Foundation
import UIKit

class FormViewController : UIViewController {
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var email: UITextField!
    
    @IBAction func onSubmit(_ sender: Any) {
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else { return }
        
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
