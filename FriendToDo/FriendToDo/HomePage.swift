//
//  HomePage.swift
//  FriendToDo
//
//  Created by Giuseppe Diciolla on 31/08/21.
//

import UIKit

class HomePage: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var friendsLabel: UILabel!
    
    var friendsList: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataReciver = DataReciver()
        tableView.dataSource = self
    
        dataReciver.getUserData(urlString: Urls.FriendsURL, context: self)
        
    }
    
    @IBAction func addFriendBAction(_ sender: Any) {
        //TODO: add a add friend action to add new friends at your list
    }
    
    func updateTV(data: [Friend]) {
        
        friendsList = data
        
        DispatchQueue.main.async {
            [weak self] in
            self?.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomFriendTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.friendName.text = self.friendsList[indexPath.row].name
        return cell
    }

}

