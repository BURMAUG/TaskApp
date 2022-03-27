//
//  TaskListView.swift
//  TodoApp
//
//  Created by DJ on 3/27/22.
//

import SwiftUI

struct TaskListView: View {

    @EnvironmentObject var taskViewModel: TaskViewModel
    var body: some View {
        List{
            ForEach(taskViewModel.items){task in
                ListRowView(task: task)
                    .onTapGesture {
                        withAnimation(.linear){
                            taskViewModel.updateTask(task: task)
                        }
                    }
                //ListRowView(task_name: task.name)
            }
            .onDelete(perform: taskViewModel.deleteTask)
        }.listStyle(.plain)
            .navigationTitle("Tasks")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddTaskView()))
            
    }

}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TaskListView()
        }.environmentObject(TaskViewModel())
    }
}


