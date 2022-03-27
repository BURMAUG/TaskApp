//
//  TodoModel.swift
//  TodoApp
//
//  Created by DJ on 3/27/22.
//

import Foundation
struct TodoModel: Identifiable, Codable{
    let id: String
    let name: String
    let isDone: Bool
    
    init(id: String = UUID().uuidString, name: String, isDone: Bool)
    {
        self.id = id
        self.name = name
        self.isDone = isDone
    }
    
    func updateComplete()->TodoModel{
        return TodoModel(id: id, name: name, isDone: !isDone)
    }
}
