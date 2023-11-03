//
//  ViewController.swift
//  IBTest
//
//  Created by 서정원 on 11/3/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet var uiTItle1: UILabel!
    
    @IBOutlet var uiTitle2: UILabel!
    
    @IBOutlet var uiTitle3: UILabel!
    
    @IBOutlet var uiTitle4: UILabel!
    
    @IBOutlet var uiTitle5: UILabel!
    
    @IBAction func clickBtn1(_ sender: Any) {
        self.uiTItle1.text = "Button01 Clicked"
    }
    
    @IBAction func clickBtn2(_ sender: Any) {
        self.uiTitle2.text = "Button02 Clicked"
    }
    
    @IBAction func clickBtn3(_ sender: Any) {
        self.uiTitle3.text = "Button03 Clicked"
    }
    
    @IBAction func clickBtn4(_ sender: Any) {
        self.uiTitle4.text = "Button04 Clicked"
    }
    
    @IBAction func clickBtn5(_ sender: Any) {
        self.uiTitle5.text = "Button05 Clicked"
    }
}

