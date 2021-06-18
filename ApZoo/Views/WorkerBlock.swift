//
//  WorkerBlock.swift
//  ApZoo
//
//  Created by Mac on 05/06/2021.
//

import SwiftUI

struct WorkerBlock: View {
    @EnvironmentObject var ObservedTM: TaskManager
    @State var IsClicked: Bool
    
    var worker: Worker
    
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
                            Text(worker.Name)
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

//struct WorkerBlock_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkerBlock()
//    }
//}
