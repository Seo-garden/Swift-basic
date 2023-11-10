//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by 서정원 on 11/9/23.
//

import Foundation
import UIKit

class ResultViewController : UIViewController {
    @IBOutlet var resultInterval: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultEmial: UILabel!

    
    var paramEmail : String = ""
    var paramUpdate : Bool = false
    var paramInterval : Double = 0
    override func viewDidLoad() {
        self.resultEmial.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
