//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by 서정원 on 11/5/23.
//

import Foundation
import UIKit

class SecondViewController : UIViewController {
    
    @IBAction func Back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
