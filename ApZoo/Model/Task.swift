//
//  Task.swift
//  ApZoo
//
//  Created by Mac on 05/06/2021.
//

import Foundation
import SwiftUI

enum PriorityStatus {
    case Low
    case Medium
    case High
}

let colors = [ PriorityStatus.High : Color.red,
               PriorityStatus.Medium : Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)),
               PriorityStatus.Low : Color.green]

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
    
    func getDescription() -> String {
        return self.description
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
