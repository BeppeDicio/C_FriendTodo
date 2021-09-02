//
//  TodoList.swift
//  FriendToDo
//
//  Created by Giuseppe Diciolla on 01/09/21.
//

import Foundation
import UIKit

class TodoListView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var friend:Friend?
    var tasks:[ToDo] = []
    var friendTasks:[ToDo] = []
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var friendName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        friendName.text = friend?.name
        
        if(friendTasks.isEmpty){
            selectFriendTasks()
        }
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        print("this are the todos \(tasks)")
    }
    
    func selectFriendTasks()  {
        for task in tasks {
            if(task.userID == friend?.id){
                friendTasks.append(task)
            }
        }
        
        updateTasks()
        
    }
    
    func updateTasks() {
        
        friendTasks = friendTasks.sorted { (lhs, rhs) -> Bool in
            return (!lhs.completed) && (rhs.completed)
        }
        
        DispatchQueue.main.async {
            [weak self] in
            self?.taskTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (!self.friendTasks[indexPath.row].completed) {
            self.friendTasks[indexPath.row].completed = true
        } else if (self.friendTasks[indexPath.row].completed){
            self.friendTasks[indexPath.row].completed = false
        }
        
        updateTasks()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! CustomTodoCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.taskTitleLabel.text = self.friendTasks[indexPath.row].title
        if (!self.friendTasks[indexPath.row].completed) {
            cell.doneTickImage.alpha = 0
        } else if (self.friendTasks[indexPath.row].completed){
            cell.doneTickImage.alpha = 1
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            deleteTaskFunc(row: indexPath.row)
        }
    }
    
    func deleteTaskFunc(){
        self.friendTasks.remove(at: row)
        updateTasks()
        //TODO: add API call to delete the task on server side
    }
}
