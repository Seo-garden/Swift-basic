//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by 서정원 on 11/9/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("segueway identifier: \(segue.identifier!)")
    }
}

