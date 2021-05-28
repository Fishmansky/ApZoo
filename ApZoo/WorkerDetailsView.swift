//
//  WorkerDetailsView.swift
//  ApZoo
//
//  Created by Mac on 07/04/2021.
//

import SwiftUI

struct WorkerDetailsViewDev: View {
    @Binding var isPresented: Bool
    var worker: Worker
    var body: some View {
        VStack(alignment: .center) {
            HStack{
                Spacer()
                Text("\(worker.name)")
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            .background(Color(#colorLiteral(red: 0.6182629615, green: 1, blue: 0.8307533205, alpha: 1)))
            .cornerRadius(8)
            VStack(alignment: .center, spacing: 10) {
                Text("Current task:")
                worker.currentTask()!.getTaskBlock()
            }.padding()
            VStack(alignment: .center, spacing: 10) {
                Text("All tasks:")
                List(worker.Tasks){ task in
                    task.getTaskBlock()
                }
            }.padding()
        }
    }
}

struct WorkerDetailsView: View {
    @Binding var isPresented: Bool
    var worker: Worker
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Text("\(worker.name)")
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                Spacer()
            }
            Form{
                Section(header: Text("Current task")){
                    worker.currentTask()?.getTaskBlock()
                }
                Section(header: Text("All tasks")){
                    ForEach(0..<worker.Tasks.count, id: \.self){
                        worker.Tasks[$0].getTaskBlock()
                    }
                }
            }
        }
    }
}

var Tom = Worker("Tom")
var d1 = Task("Duty1", .High)
var d2 = Task("Duty2", .High)
var d3 = Task("Duty3", .High)

struct InteractiveWorkerBlock: View {
    @EnvironmentObject var ObservedTM: TaskManager
    var worker: Worker
    var tasks = 3
    @State var IsClicked: Bool
    var body: some View {
        ZStack{
            ZStack{
                Rectangle()
                    .frame(width: 300, height: IsClicked ? CGFloat((worker.Tasks.count+1)*70) : 70, alignment: .top)
                    .foregroundColor(.silk)
                    .cornerRadius(20)
                    .animation(.default)
                    .onTapGesture {
                        IsClicked.toggle()
                    }
                HStack{
                    Text((worker.currentTask()?.getPriority())!)
                }
            }
            
            ZStack{
                Rectangle()
                    .frame(width: IsClicked ? 130 : 300, height: 70, alignment: .top)
                    .foregroundColor(.salmon)
                    .cornerRadius(20)
                    .offset(x: IsClicked ? -85 : 0,y: IsClicked ? CGFloat((worker.Tasks.count)*(-35)) : 0)
                    .animation(.default)
                    .onTapGesture {
                        IsClicked.toggle()
                    }
                HStack{
                    Spacer()
                    Text(worker.name)
                        .fontWeight(.semibold)
                        .font(.system(size: 21))
                        .foregroundColor(Color.init(#colorLiteral(red: 0.3490196078, green: 0.1607843137, blue: 0.2549019608, alpha: 1)))
                    Spacer()
                    VStack{
                        Text("Current task:")
                            .foregroundColor(.white)
                        Text(worker.currentTaskDescription())
                            .foregroundColor(Color.init(#colorLiteral(red: 0.3490196078, green: 0.1607843137, blue: 0.2549019608, alpha: 1)))
                    }
                    .offset(x: IsClicked ? 10 : 0)
                    Spacer()
                    
                }
                .offset(y: IsClicked ? CGFloat((worker.Tasks.count)*(-35)) : 0)
                .animation(.default)
                
            }

        }

    }
}

struct InteractiveWorkerBlock2: View {
    @EnvironmentObject var ObservedTM: TaskManager
    var worker: Worker
    @State var IsClicked: Bool
    var body: some View {
        ZStack{
            ZStack{
                Rectangle()
                    .frame(width: 300, height: IsClicked ? 140 : 70, alignment: .top)
                    .foregroundColor(.silk)
                    .cornerRadius(20)
                    .offset(y: IsClicked ? 35 : 0)
                    .animation(.default)
                    .onTapGesture {
                        IsClicked.toggle()
                    }
                HStack{
                    VStack{
                        Text("Priority")
                            .foregroundColor(.mauve)
                        Text((worker.currentTask()?.getPriority())!)
                            .foregroundColor(.mauve)
                    }
                    .padding()
                    VStack{
                        Text("Status")
                            .foregroundColor(.mauve)
                        ZStack(alignment: .leading){
                            Rectangle()
                                .frame(width: 160, height: 15, alignment: .leading)
                                .foregroundColor(.WhiteBlue)
                            Rectangle()
                                .frame(width: CGFloat(worker.currentTask()?.getStatus() ?? 0) * 1.6, height: 15, alignment: .leading)
                                .foregroundColor(.DarkBlue)
                        }
                        
                    }
                    
                }
                .offset(y: IsClicked ? 70 : 0)
                .animation(.default)

            }
            
            ZStack{
                Rectangle()
                    .frame(width: IsClicked ? 130 : 300, height: 70, alignment: .top)
                    .foregroundColor(.salmon)
                    .cornerRadius(20)
                    .offset(x: IsClicked ? -85 : 0,y: IsClicked ? CGFloat((worker.Tasks.count)*(-35)) : 0)
                    .animation(.default)
                    .onTapGesture {
                        IsClicked.toggle()
                    }
                HStack{
                    Spacer()
                    Text(worker.name)
                        .fontWeight(.semibold)
                        .font(.system(size: 21))
                        .foregroundColor(.mauve)
                    Spacer()
                    VStack{
                        Text("Current task")
                            .foregroundColor(.white)
                        Text(worker.currentTaskDescription())
                            .foregroundColor(.mauve)
                    }
                    .offset(x: IsClicked ? 10 : 0)
                    .animation(.default)
                    Spacer()
                    
                }
                .offset(y: IsClicked ? CGFloat((worker.Tasks.count)*(-35)) : 0)
                .animation(.default)
                
            }

        }

    }
}


struct WorkerDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        InteractiveWorkerBlock2(worker: Tom, IsClicked: false)
    }
}
