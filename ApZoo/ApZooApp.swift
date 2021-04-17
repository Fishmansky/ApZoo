//
//  ApZooApp.swift
//  ApZoo
//
//  Created by Mac on 14/03/2021.
//

import Combine
import SwiftUI



class User: Identifiable {
    private let login:  String
    private var password: String
    var id: UUID
    
    init(login: String, password: String){
        self.login = login
        self.password = password
        id = UUID.init()
    }
    
    func getLogin() -> String {
        return self.login
    }
    
    func checkPassword(pass: String)-> Bool{
        if pass == self.password{
            return true
        } else {
            return false
        }
    }
}


class Logger: ObservableObject {
    @Published var UserDatabase: [User]
    
    init(){
        UserDatabase = [User(login: "admin",password: "admin")]
    }
    
    func UserIsRegistered(login: String) -> (Bool,Int) {
        for i in 0..<UserDatabase.count {
            if UserDatabase[i].getLogin() == login {
                return (true, i)
            }
        }
        return (false, -1)
    }
    
    func CheckUserPassword(userID: Int, password: String) -> Bool{
        if (UserDatabase[userID].checkPassword(pass: password)){
            return true
        } else {
            return false
        }
    }
    
    func login(login: String, password: String) -> Bool{
        let attempt = UserIsRegistered(login: login)
        if attempt.0 == true {
            if (CheckUserPassword(userID: attempt.1, password: password)){
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}

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
    
    func getUserCircle()-> some View{
        let userCircle = SwiftUI.VStack(content: {
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
        let TaskBlock = SwiftUI.HStack(content: {
            Text(description)
            Spacer()
            Text(self.getPriority())
                .fontWeight(.semibold)
                .frame(height: 26, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
    var ApLogger = Logger()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
