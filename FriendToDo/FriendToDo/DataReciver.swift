//
//  DataReciver.swift
//  FriendToDo
//
//  Created by Giuseppe Diciolla on 01/09/21.
//

import Foundation

class DataReciver {
    
    //TODO: refactor this class to deleta the dependency on the HomePage class
    public func getUserData(urlString: String, context: HomePage){
        
        var friends = [Friend]()
        let decoder = JSONDecoder()
        var friendsData = Data()
        
        
        let urlStringTest = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: urlStringTest) {(data, response, error) in
            guard let data = data else { return }
            friendsData = data
            print(String(data: data, encoding: .utf8)!)
            
            if !friendsData.isEmpty {
                do {
                    friends = try decoder.decode([Friend].self, from: friendsData)
                    context.updateTV(data: friends)
                    //print(friends[0].id)
                } catch {
                    //TODO: manage loading error
                    print(error)
                }
            } else {
                //TODO: empty friends list
            }
        }
        
        task.resume()
    }
}
