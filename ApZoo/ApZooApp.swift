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
               PriorityStatus.Medium : Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)),
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
    
    func currentTaskDescription() -> String{
        if Tasks.count == 0 {
            return "Nothing"
        } else {
            return Tasks.first!.description
        }
    }
    
    func currentTask() -> Task? {
        if Tasks.isEmpty {
            return Task("Nothing", .Low)
        } else {
            return Tasks.first
        }
    }
    
    func ViewBlock()-> some View{
        var body: some View {
            HStack{
                Text(self.name)
                    .fontWeight(.semibold)
                    .font(.system(size: 21))
                    .foregroundColor(Color.init(#colorLiteral(red: 0.3490196078, green: 0.1607843137, blue: 0.2549019608, alpha: 1)))
                    .padding()
                Spacer()
                VStack{
                    Text("Current task:")
                        .foregroundColor(.white)
                    Text("\(self.currentTaskDescription())")
                        .foregroundColor(Color.init(#colorLiteral(red: 0.3490196078, green: 0.1607843137, blue: 0.2549019608, alpha: 1)))
                }
                Spacer()
            }
            
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .topLeading
                )
            .background(Color.init(#colorLiteral(red: 0.8862745098, green: 0.5843137255, blue: 0.4705882353, alpha: 1)))
            .clipShape(Capsule())
        }
        return body
    }
    
    func InteractiveWorkerBlock()-> some View{
        var body: some View {
            Capsule()
        }
        return body
    }
}

class Task: Identifiable, ObservableObject {
    
    @Published var description: String
    @Published var Priority: PriorityStatus
    @Published var Status: Double
    @Published var Id: String
    
    init (_ desc: String, _ priority: PriorityStatus, _ status: Double = 0){
        description = desc
        Priority = priority
        Id = UUID().uuidString
        Status = status
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
    
    func getStatus() -> Double {
        return self.Status
    }
    
    func getTaskBlock()-> some View{
        let TaskBlock = SwiftUI.HStack(content: {
            Text(description)
                .fontWeight(.semibold)
            Spacer()
            Text(self.getPriority())
                .fontWeight(.semibold)
                .frame(height: 26, alignment: .center)
                .background(colors[self.Priority])
                .foregroundColor(.white)
                .cornerRadius(8)
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
