//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by DJ on 3/27/22.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var listviewModel: TaskViewModel = TaskViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TaskListView()
            }
            .environmentObject(TaskViewModel())
        }
    }
}
