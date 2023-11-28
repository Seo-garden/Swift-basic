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
        ("다크나이트", "영웅물에", "2202-22-22", "8.95"),
        ("범죄도시", "영웅물에", "2202-22-22", "8.95"),
        ("다크나이", "영웅물에", "2202-22-22", "8.95")
    ]
    
    lazy var list: [MovieVO] = { //lazy 를 붙여 변수를 정의하면 참조되는 시점에 맞추어 초기화되므로 메모리 낭비를 줄일 수 있다.
        //두번째 이유 lazy 키워드가 붙이지 않은 프로퍼티는 다른 프로퍼티를 참조할 수 없기 때문이다.
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{ //생성해야 할 행의 개수를 반환하는 메소드
        return self.list.count      //배열 타입 객체의 길이를 가져오는 값
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {   //개별행을 만드는 메소드
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!   //확실하게 아이디를 입력해주었다면 nil 값이 반환될 가능성이 없다.
        cell.textLabel!.text = "asdasd"
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
}


//버전이 지나서 할 수 없다.

//https://www.youtube.com/watch?v=bXHinfFMkFw
