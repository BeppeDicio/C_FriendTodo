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
    var toDos: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataReciver = DataReciver()
        tableView.dataSource = self
    
        dataReciver.getUserData(urlString: Urls.FriendsURL, context: self)
        dataReciver.getFriendTasks(urlString: Urls.ToDoURL, context: self)
        
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
    func updateToDosTV(data: [ToDo]) {
        
        toDos = data
        
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
        
        var count: Int = 0
        
        for toDo in self.toDos {
            if(toDo.userID == self.friendsList[indexPath.row].id) {
                count = count + 1
            }
        }
        
        cell.friendName.text = self.friendsList[indexPath.row].name
        cell.toDosLabel.text = "You have \(count) with this friend!"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "TodoListSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabCtrl: UITabBarController = segue.destination as! UITabBarController
        let vc = tabCtrl.viewControllers![0] as! TodoListView
        vc.friend = friendsList[self.tableView.indexPathForSelectedRow!.row]
        vc.tasks = self.toDos
    }
}

