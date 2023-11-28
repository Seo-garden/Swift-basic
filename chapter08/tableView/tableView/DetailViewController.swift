//
//  DetailViewController.swift
//  tableView
//
//  Created by 서정원 on 11/28/23.
//

import UIKit

class DetailViewController: UIViewController {
    var myName = ""
    @IBOutlet weak var myNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myNameLabel.text = myName
    }
    func setLabel(with text: String){
        myName = text
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
