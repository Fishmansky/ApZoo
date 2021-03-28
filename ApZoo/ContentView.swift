//
//  ContentView.swift
//  ApZoo
//
//  Created by Mac on 14/03/2021.
//

import SwiftUI

struct WorkersView: View {
    var body: some View {
        List(TM.WorkerList) { worker in
                VStack(alignment: .leading) {
                        Text(worker.name)
                    Text("Currently working on: \(worker.currentTask())")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    
                }
            }
    }
}

struct TasksView: View {
    var body: some View {
        let layoutWorkers: [GridItem] = [GridItem(.flexible())]
        let layoutTasks: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
        let colors = [ PriorityStatus.High : Color.red,
                       PriorityStatus.Medium : Color.yellow,
                       PriorityStatus.Low : Color.green]
        VStack{
            ScrollView(.horizontal) {
                LazyHGrid(rows: layoutWorkers, content: {
                    ForEach((0..<TM.WorkerList.count), id: \.self) {
                        TM.WorkerList[$0].getUserCircle()
                    }
                })
            }
            .frame(height: 100)
            ScrollView {
                LazyVGrid(columns: layoutTasks, spacing: 20) {
                    ForEach((0..<TM.TaskList.count), id: \.self) {
                        Text(TM.getTaskList() [$0 % TM.TaskList.count])
                            .font(.system(size: 20))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
                            .background(colors[TM.TaskList[$0].Priority])
                            .cornerRadius(10)
                    }
                }
            }
        }
        
    }
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center){
            HStack(){
                Spacer()
                Image("Logo2-text")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Image("Logo2-pic")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .scaledToFit()
            TabView{
                WorkersView()
                    .tabItem {
                        Label("Workers", systemImage: "list.dash")
                    }
                TasksView()
                    .tabItem {
                        Label("Tasks", systemImage: "list.dash")
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
