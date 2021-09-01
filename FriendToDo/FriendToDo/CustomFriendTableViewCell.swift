//
//  CustomFriendTableViewCell.swift
//  FriendToDo
//
//  Created by Giuseppe Diciolla on 01/09/21.
//

import Foundation
import UIKit

class CustomFriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var toDosLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
