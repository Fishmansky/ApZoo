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
var duty = Task("Duty", .High)
var tasks = [Task("Duty1", .High, 25), Task("Duty2", .High, 50), Task("Duty3", .High, 75)]

struct InteractiveWorkerBlock: View {
    var worker: Worker
    @State var IsClicked: Bool
    var body: some View {
        VStack{
            ZStack(alignment: .top){
                ZStack(alignment: .bottom){
                    Rectangle()
                        .frame(width: 300, height: IsClicked ? 140 : 70, alignment: .top)
                        .foregroundColor(.silk)
                        .cornerRadius(20)
                        .animation(.default)
                        .onTapGesture {
                            IsClicked.toggle()
                        }
                    HStack{
                        VStack{
                            Text("Priority")
                                .foregroundColor(.mauve)
                            Text((worker.currentTask()?.getPriority())!)
                                .foregroundColor(colors[worker.currentTask()!.Priority])
                        }
                        VStack{
                            Text("Status")
                                .foregroundColor(.mauve)
                            ZStack(alignment: .leading){
                                Rectangle()
                                    .frame(width: 160, height: 13, alignment: .leading)
                                    .foregroundColor(.WhiteBlue)
                                Rectangle()
                                    .frame(width: CGFloat(1.6*(worker.currentTask()?.getStatus())!), height: 15, alignment: .leading)
                                    .foregroundColor(.DarkBlue)
                                    .animation(.default)
                            }
                        }
                        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.bottom, 15)
                    .animation(.default)
                }
                ZStack{
                    Rectangle()
                        .frame(width: 300, height: 70, alignment: .top)
                        .foregroundColor(.salmon)
                        .cornerRadius(20)
                        .animation(.default)
                        .onTapGesture {
                            IsClicked.toggle()
                        }
                    HStack{
                        HStack(alignment: .center){
                            Text(worker.name)
                                .fontWeight(.semibold)
                                .font(.system(size: 21))
                                .foregroundColor(.mauve)
                        }
                        .frame(width: 120, height: 70)
                        HStack(alignment: .center){
                            VStack{
                                Text("Current task")
                                    .foregroundColor(.white)
                                Text(worker.currentTaskDescription())
                                    .foregroundColor(.mauve)
                            }
                            .animation(.default)
                        }.frame(width: 180, height: 70)

                    }
                    .animation(.default)
                }
            }
        }
    }
}

struct WorkerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        InteractiveWorkerBlock(worker: Tom, IsClicked: false)
    }
}
