//
//  ViewController.swift
//  tableView
//
//  Created by 서정원 on 11/28/23.
//

import UIKit

class ViewController: UIViewController {

    private var names : [String] = ["mikasa", "eren", "armin"]
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let index = indexPath?.row ?? 0
           
            let detailView = segue.destination as! DetailViewController
            detailView.setLabel(with:names[index])
            
            if names[index] == "mikasa" {
                detailView.view.backgroundColor = .red
            } else {
                detailView.view.backgroundColor = .orange
            }
        }
    }
    @IBAction func didTapButton(_ sender: Any) {
        names.append(nameTextField.text ?? "empty")
        tableView.reloadData()
        print(names)
    }
}


extension ViewController : UITableViewDataSource {
//  하나의 섹션에 몇개의 로우를 만들것인가. 구현하지 않으면 1개 리턴값에 따라 테이블뷰 줄이 생성된다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
//  row 와 section 이 합쳐져서 indexPath 에 할당된다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("indexPath 가 0입니다.")
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "delete", handler: {_,_,_ in})])
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [UIContextualAction (style: .normal, title: "Edit", handler: {_,_,_ in })])
    }
}
