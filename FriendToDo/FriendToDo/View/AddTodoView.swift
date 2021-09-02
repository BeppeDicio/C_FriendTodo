//
//  AddTodoView.swift
//  FriendToDo
//
//  Created by Giuseppe Diciolla on 01/09/21.
//

import Foundation
import UIKit

class AddTodoView: UIViewController {
    
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var taskTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Download function of the friend tasks, every time that this page is reloaded
        //so that you have every time the list uptodate. At the moment the data reciver has a
        //view controller dependency and need Refactoring
        
        addTaskButton.layer.cornerRadius = 20
    }
    
    func addTaskToList(title: String) {
        
        //TODO: create function that creates ToDo obdject and sent the Post to API server
        //TODO: if the response is 200OK the interface will cleanup and you can inser your next task
        
        //Only for user feedback propose
        taskTextField.text = ""
        
    }
    
    @IBAction func addTaskButtonAction(_ sender: Any) {
        
        let title = taskTextField.text ?? ""
        
        if (title != ""){
            addTaskToList(title: title)
        }
    }
}
