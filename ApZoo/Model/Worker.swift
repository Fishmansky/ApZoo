//
//  Worker.swift
//  ApZoo
//
//  Created by Mac on 05/06/2021.
//

import Foundation
import SwiftUI

class Worker: Identifiable, ObservableObject {
    var Name: String
    @Published var id: String
    
    init (_ name: String){
        Name = name
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
    
    func taskIsFinished(_ task: Task) -> Void {
        let index = Tasks.firstIndex{$0 === task}
        Tasks.remove(at: index!)
    }
}
