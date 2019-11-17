//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit

let names = ["Byron Fisher","Garrett Doyle","Angel Hammond","Brianna Bradley","Evelyn Ellis"]

class TableViewController : UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
    cell.textLabel?.text = names[indexPath.row]
    return cell
  }
}

PlaygroundPage.current.liveView = TableViewController()

//: [Next](@next)
