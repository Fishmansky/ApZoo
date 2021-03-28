//
//  ApZooApp.swift
//  ApZoo
//
//  Created by Mac on 14/03/2021.
//

import SwiftUI

enum PriorityStatus {
    case Low
    case Medium
    case High
}

class Worker: Identifiable {
    let name: String
    
    init (_ n: String){
        name = n
    }
    
    var Tasks = [Task]()
    
    func addTask(_ newTask: Task){
        Tasks.append(newTask)
    }
    
    func currentTask() -> String{
        return Tasks.first!.description
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

class Task: Identifiable {
    let description: String
    let Priority: PriorityStatus
    
    init (_ desc: String, priority: PriorityStatus){
        description = desc
        Priority = priority
    }
}

class TaskManager {
    
    var WorkerList: [Worker] = []
    var TaskList: [Task] = []
    init (){
        WorkerList.append(Worker("Adam"))
        WorkerList.append(Worker("Adm"))
        WorkerList.append(Worker("Ada32"))
        TaskList.append(Task("Do the vaccuming", priority: .High))
        TaskList.append(Task("Do the dishes", priority: .Medium))
        TaskList.append(Task("Check water supply", priority: .Low))
        
        
        WorkerList[0].addTask(TaskList[0])
        WorkerList[1].addTask(TaskList[1])
        WorkerList[2].addTask(TaskList[2])
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
    

}

var TM = TaskManager()

@main
struct ApZooApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
