//
//  TodoList.swift
//  FriendToDo
//
//  Created by Giuseppe Diciolla on 01/09/21.
//

import Foundation
import UIKit

class TodoListView: UIViewController {
    
    var friend:Friend?
    
    @IBOutlet weak var friendName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        friendName.text = friend?.name
    }
}
