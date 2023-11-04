//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by 서정원 on 11/4/23.
//

import UIKit

class SecondViewController : UIViewController {
    
    
    @IBAction func Back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
