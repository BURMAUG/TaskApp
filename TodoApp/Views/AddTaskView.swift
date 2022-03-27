
//
//  AddTaskView.swift
//  TodoApp
//
//  Created by DJ on 3/27/22.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State var textfieldTxt:String = ""
    
    @State var alart_text:String = ""
    @State var showAlert: Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type here", text: $textfieldTxt)
                Button(action: saveNewTask, label: {Text("Save")})
            }.padding(23)
        }.navigationTitle("Add New Task")
            .alert(isPresented: $showAlert, content: alertError)
    }
    
    func saveNewTask(){
        if letterCountAccepted(){
            taskViewModel.addNewTask(title: textfieldTxt)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func letterCountAccepted()-> Bool{
        if textfieldTxt.count < 3
        {
            alart_text = "Task must be more than 3 letters"
            showAlert.toggle()
            return false
        }
        return true
    }
    func alertError() -> Alert{
        return Alert(title: Text(alart_text))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddTaskView()
        }.environmentObject(TaskViewModel())
    }
}
