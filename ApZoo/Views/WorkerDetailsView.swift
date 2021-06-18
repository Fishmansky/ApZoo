//
//  WorkerDetailsView.swift
//  ApZoo
//
//  Created by Mac on 07/04/2021.
//

import SwiftUI

struct WorkerDetailsView: View {
    @Binding var isPresented: Bool
    var worker: Worker
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Text("\(worker.Name)")
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
//    @State var isPresented = true
//    static var previews: some View {
//        WorkerDetailsView(isPresented: $isPresented, worker: <#Worker#>)
//    }
//}
