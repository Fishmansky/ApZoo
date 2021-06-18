//
//  TasksView.swift
//  ApZoo
//
//  Created by Mac on 07/04/2021.
//

import SwiftUI

struct TasksView: View {
    @State var isPresentingAssigninView = false
    @EnvironmentObject var ObservedTM: TaskManager
    @State var newTaskDescription = ""
    @State var NewTaskPriority = PriorityStatus.Low
    
    var T_List: [Task] {
        ObservedTM.TaskList
    }
    
    var body: some View {
        VStack{
            HStack {
                Text("Awaiting tasks")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(.leading, 10)
                Spacer()
            }
            List(T_List){ task in
                HStack{
                    VStack(alignment: .leading) {
                        Text(task.description)
                        Text("Priority: \(task.getPriority())")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {
                        isPresentingAssigninView.toggle()
                    }
                    , label: {
                        Text("Assign")
                            .fontWeight(.semibold)
                            .frame(width: 105, height: 32, alignment: .center)
                            .background(Color.yellow)
                            .foregroundColor(.white)
                    })
                    .cornerRadius(8)
                    .sheet(isPresented: $isPresentingAssigninView, content: {
                        SelectionView(passedTask: task, isPresented: $isPresentingAssigninView)
                    })
                }
            }
            VStack{
                TextField("New Task", text: $newTaskDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack{
                    Picker("Select Priority", selection: $NewTaskPriority, content: {
                            Text("Low").tag(PriorityStatus.Low)
                            Text("Medium").tag(PriorityStatus.Medium)
                            Text("High").tag(PriorityStatus.High)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    Button(action: {
                        if(!newTaskDescription.isEmpty){
                            ObservedTM.TaskList.append(.init(newTaskDescription, NewTaskPriority))
                            newTaskDescription = ""
                        }
                    }, label: {
                        Text("Add Task")
                            .fontWeight(.semibold)
                            .frame(width: 105, height: 32, alignment: .center)
                            .background(Color.green)
                            .foregroundColor(.white)
                    })
                    .cornerRadius(8)
                }
            }
            .padding()
        }

    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
