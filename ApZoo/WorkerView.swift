//
//  WorkerView.swift
//  ApZoo
//
//  Created by Mac on 18/06/2021.
//

import SwiftUI
import Combine


struct WorkerView: View {
    @EnvironmentObject var ObservedTM: TaskManager
    @ObservedObject var worker: Worker
    var t_list: [Task] { worker.Tasks }
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("\(worker.Name)")
                    .font(.system(size:30))
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            HStack{
                Text("Your tasks:")
                    .fontWeight(.semibold)
                    .padding(.leading, 40)
                Spacer()
            }
            ScrollView{
                ForEach(0..<t_list.count, id:\.self) { task in
                    TaskInteractiveBlock(t_owner: worker, task: t_list[task])
                }
            }
        }
    }
}

struct TaskInteractiveBlock: View {
    @EnvironmentObject var ObservedTM: TaskManager
    @State var t_owner: Worker
    @ObservedObject var task: Task
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                Rectangle()
                    .frame(width: 300, height: 100)
                    .foregroundColor(.WhiteBlue)
                    .cornerRadius(20)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    if(task.Status >= 100) {
                        Button(action: { t_owner.Tasks.removeFirst() }, label: {
                            Text("Set as finished")
                                .fontWeight(.semibold)
                                .font(.system(size: 30))
                        })
                    } else {
                        VStack{
                            Text("Priority")
                            Text(task.getPriority())
                                .foregroundColor(colors[task.Priority])
                                .fontWeight(.semibold)
                        }
                        VStack{
                            Text("Status")
                            
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                                Rectangle()
                                    .frame(width: 160, height: 13, alignment: .center)
                                    .foregroundColor(.salmon)
                                Rectangle()
                                    .frame(width: CGFloat(task.Status * 1.6), height: 15, alignment: .leading)
                                    .foregroundColor(.mauve)
                                    .animation(.default)
                            }
                        }
                    }
                })
                .padding(.bottom, 3)
                
            }
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
                Rectangle()
                    .frame(width: 300, height: 50, alignment: .leading)
                    .foregroundColor(.DarkBlue)
                    .cornerRadius(20)
                HStack{
                    Text(task.getDescription())
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Button(action: {  if (task.Status < 100){ task.Status += 10.0 }}, label: {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.yellow)
                                .font(.system(size: 30, weight: .bold))
                    })
                }
            }
        }
    }
}

//struct WorkerView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkerView()
//    }
//}
