//
//  ListRowView.swift
//  TodoApp
//
//  Created by DJ on 3/27/22.
//

import SwiftUI

struct ListRowView: View {
    let task: TodoModel
    var body: some View {
        HStack {
            Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(task.isDone ? .green : .red)
            Text(task.name)
            Spacer()
        }.font(.title2).padding(.vertical, 9)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var task1 = TodoModel(name: "DONE WITH HOMEWORK", isDone: false)
    static var task2 = TodoModel(name: "Clean office", isDone: true)
    
    static var previews: some View {
        Group{
            ListRowView(task: task1)
            ListRowView(task: task2)
        }.previewLayout(.sizeThatFits)
    }
}
