//
//  ContentView.swift
//  ApZoo
//
//  Created by Mac on 14/03/2021.
//

import Combine
import SwiftUI

struct WorkersView: View {
    @State var newName = ""
    @State var isPresentingWorkerView = false
    @EnvironmentObject var ObservedTM: TaskManager
    
    var body: some View {
        VStack{
            NavigationView {
                List(ObservedTM.WorkerList) { worker in
                    NavigationLink(
                        destination: WorkerDetailsView(isPresented: $isPresentingWorkerView, worker: worker),
                        label: {
                            VStack(alignment: .leading) {
                                    Text(worker.name)
                                Text("Currently working on: \(worker.currentTask())")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                            }
                        })
                }
                .navigationTitle("Workers")
            }
            
            HStack{
                TextField("New Worker", text: $newName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    if(!newName.isEmpty){
                        ObservedTM.WorkerList.append(.init(newName))
                        newName = ""
                    }
                }, label: {
                    Text("Add Worker")
                        .fontWeight(.semibold)
                        .frame(width: 105, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.green)
                        .foregroundColor(.white)
                })
                .cornerRadius(8)
            }
            .padding()
        }
    }
}

struct ContentView: View {
    @StateObject var ObservedTM = TaskManager()
    var body: some View {
        VStack(alignment: .center){
//            HStack{
//                Spacer()
//                Image("Logo2-text")
//                    .resizable()
//                    .scaledToFit()
//                Spacer()
//                Image("Logo2-pic")
//                    .resizable()
//                    .scaledToFit()
//                Spacer()
//            }
//            .scaledToFit()
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
        .environmentObject(ObservedTM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
