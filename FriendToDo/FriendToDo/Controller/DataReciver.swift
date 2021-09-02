//
//  DataReciver.swift
//  FriendToDo
//
//  Created by Giuseppe Diciolla on 01/09/21.
//

import Foundation

class DataReciver {
    
    //TODO: refactor this class to deleta the dependency on the HomePage class
    public func getFriendsData(urlString: String, context: HomePage){
        
        var friends = [Friend]()
        var friendsData = Data()
        
        
        let urlStringFormatted = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: urlStringFormatted) {(data, response, error) in
            guard let data = data else { return }
            friendsData = data
            //print(String(data: data, encoding: .utf8)!)
            
            friends = self.parseFreindApiResult(data: friendsData)
            context.updateTV(data: friends)
        }
        
        task.resume()
    }
    
    //TODO: refactor this class to deleta the dependency on the HomePage class and code duplication
    public func getFriendTasks(urlString: String, context: HomePage){
        
        var toDos = [ToDo]()
        var toDoData = Data()
        
        
        let urlStringFormatted = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: urlStringFormatted) {(data, response, error) in
            guard let data = data else { return }
            toDoData = data
            print(String(data: data, encoding: .utf8)!)
            
            toDos = self.parseFreindApiResult(data: toDoData)
            context.updateToDosTV(data: toDos)
               
        }
        
        task.resume()
    }
    
    func parseFreindApiResult(data: Data) -> [ToDo]{
        
        var toDos = [ToDo]()
        let decoder = JSONDecoder()
        
        if !data.isEmpty {
            do {
                toDos = try decoder.decode([ToDo].self, from: data)
                return toDos
            } catch {
                //TODO: manage loading error
                print(error)
                return []
            }
        } else {
            //TODO: empty friends list
            return []
        }
    }
    
    func parseFreindApiResult(data: Data) -> [Friend]{
        
        var friends = [Friend]()
        let decoder = JSONDecoder()
        
        if !data.isEmpty {
            do {
                friends = try decoder.decode([Friend].self, from: data)
                return friends
                //print(friends[0].id)
            } catch {
                //TODO: manage loading error
                print(error)
                return []
            }
        } else {
            //TODO: empty friends list
            return []
        }
    }
}
