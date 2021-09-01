//
//  ToDo.swift
//  FriendToDo
//
//  Created by Giuseppe Diciolla on 01/09/21.
//

import Foundation

// MARK: - ToDo
class ToDo: Codable {
    var userID, id: Int
    var title: String
    var completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }

    init(userID: Int, id: Int, title: String, completed: Bool) {
        self.userID = userID
        self.id = id
        self.title = title
        self.completed = completed
    }
}
