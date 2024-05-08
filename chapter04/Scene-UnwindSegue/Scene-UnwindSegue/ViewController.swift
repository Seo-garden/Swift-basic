//
//  ViewController.swift
//  Scene-UnwindSegue
//
//  Created by 서정원 on 11/6/23.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func unwindToVC(_ segue : UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToB" {
            // B 파일의 인스턴스를 가져옵니다.
            if let bViewController = segue.destination as? SecondViewController {
                // B 파일에 필요한 데이터를 설정합니다.
                
            }
        }
    }
}

