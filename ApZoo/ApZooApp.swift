//
//  ApZooApp.swift
//  ApZoo
//
//  Created by Mac on 14/03/2021.
//

import Combine
import SwiftUI

final class TaskManager: ObservableObject {
    
    @Published var WorkerList: [Worker] = []
    @Published var TaskList: [Task] = []
    
    init (){
        WorkerList.append(Worker("Adam"))
        WorkerList.append(Worker("Tom"))
        WorkerList.append(Worker("Lisa"))
        self.addTask("Do the vaccuming", .High)
        self.addTask("Do the dishes", .Medium)
        self.addTask("Check water supply", .Low)
    }
    
    func getWorkerTaskList(_ worker: Worker) -> [Task] {
        if (WorkerList.contains { $0.Name == worker.Name }){
            return worker.Tasks
        } else {
            return []
        }
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
            StringList.append(worker.Name)
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
    @StateObject var ObservedTM = TaskManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ObservedTM)
        }
    }
}
