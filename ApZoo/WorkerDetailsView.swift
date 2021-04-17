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

//struct WorkerDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkerDetailsView()
//    }
//}
