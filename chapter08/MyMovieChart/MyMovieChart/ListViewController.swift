//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 서정원 on 11/22/23.
//

import Foundation
import UIKit

class ListViewController : UITableViewController {
    var dataset = [
        ("다크나이트", "영웅물에  ~~", "2202-22-22", "8.95"),
        ("다크나이2", "영웅물에  ~~", "2202-22-22", "8.95"),
        ("다크나이트3", "영웅물에  ~~", "2202-22-22", "8.95")
    ]
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        for(title, description, opendate, rating) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = description
            mvo.opendate = opendate
            mvo.rating = Double(rating)
            
            datalist.append(mvo)
        }
        
        return datalist
    }()
    override func viewDidLoad() {
    }
}
