//
//  ApZooApp.swift
//  ApZoo
//
//  Created by Mac on 14/03/2021.
//

import Combine
import SwiftUI

enum PriorityStatus {
    case Low
    case Medium
    case High
}

let colors = [ PriorityStatus.High : Color.red,
               PriorityStatus.Medium : Color.yellow,
               PriorityStatus.Low : Color.green]

class Worker: Identifiable, ObservableObject {
    let name: String
    @Published var id: String
    
    init (_ n: String){
        name = n
        id = UUID().uuidString
    }
    
    @Published var Tasks = [Task]()
    
    func addTask(_ newTask: Task){
        Tasks.append(newTask)
    }
    
    func currentTask() -> String{
        if Tasks.count == 0 {
            return "Nothing"
        } else {
        return Tasks.first!.description
        }
    }
    func getUserCircle()-> some View{
        let userCircle = SwiftUI.VStack(content: {
            Image("Logo2-pic")
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                .frame(width: 40, height: 40, alignment: .center)
            Text(name)
        })
        return userCircle
    }
}

class Task: Identifiable, ObservableObject {
    
    @Published var description: String
    @Published var Priority: PriorityStatus
    @Published var id: String
    
    init (_ desc: String, _ priority: PriorityStatus){
        description = desc
        Priority = priority
        id = UUID().uuidString
    }
    
    func getPriority() -> String {
        switch (self.Priority) {
        case .High:
            return "High"
        case .Medium:
            return "Medium"
        case .Low:
            return  "Low"
        }
    }
    
    func getTaskBlock()-> some View{
        let TaskBlock = SwiftUI.VStack(content: {
            Text(description)
        })
        return TaskBlock
    }
}

class TaskManager: ObservableObject {
    
    @Published var WorkerList: [Worker] = []
    @Published var TaskList: [Task] = []
    
    init (){
        WorkerList.append(Worker("Adam"))
        WorkerList.append(Worker("Adm"))
        WorkerList.append(Worker("Ada32"))
        self.addTask("Do the vaccuming", .High)
        self.addTask("Do the dishes", .Medium)
        self.addTask("Check water supply", .Low)


//        WorkerList[0].addTask(TaskList[0])
//        WorkerList[0].addTask(TaskList[1])
//        WorkerList[0].addTask(TaskList[2])
    }
    
    func addTask(_ task: String, _ priority: PriorityStatus){
        self.TaskList.append(Task(task, priority))
    }
    
    func addInitializedTask(_ task: Task){
        self.TaskList.append(task)
    }
    
    func getWorkerList() -> [String]{
        var StringList = [String]()
        for worker in WorkerList {
            StringList.append(worker.name)
        }
        return StringList
    }
    
    func getTaskList() -> [String]{
        var StringList = [String]()
        for task in TaskList {
            StringList.append(task.description)
        }
        return StringList
    }
    
    func releaseTask(_ task: Task) {
        let index = TaskList.firstIndex{$0 === task}
        TaskList.remove(at: index!)
    }
}

@main
struct ApZooApp: App {
    var TM = TaskManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
