//
//  TaskViewModel.swift
//  TodoApp
//
//  Created by DJ on 3/27/22.
//

import Foundation

class TaskViewModel: ObservableObject{
    @Published var items:[TodoModel] = []{
        didSet{
            saveTasks()
        }
    }
    let key:String = "task_list"
    
    init(){
        getAllTasks()
    }
    
    func getAllTasks(){
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let savedTasks = try? JSONDecoder().decode([TodoModel].self, from: data)
        else{ return }
        self.items = savedTasks
        
    }
    //delete a task from the tasks list and view
    func deleteTask(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    
    func addNewTask(title: String){
        let newTask = TodoModel(name: title, isDone: false)
        items.append(newTask)
    }

    func updateTask(task: TodoModel){
        if let index = items.firstIndex(where: {$0.id == task.id}){
            items[index] = task.updateComplete()
        }
    }
    //saving
    func saveTasks(){
        if let encodededData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodededData, forKey: key)
        }
    }
}
