//
//  HomePage.swift
//  FriendToDo
//
//  Created by Giuseppe Diciolla on 31/08/21.
//

import UIKit

class HomePage: UIViewController, UITableViewDataSource {

    let tableViewData = Array(repeating: "Item", count: 5)
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var friendsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        tableView.dataSource = self
    }
    
    @IBAction func addFriendBAction(_ sender: Any) {
        //TODO: add a add friend action to add new friends at your list
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = self.tableViewData[indexPath.row]
        return cell
    }

}

