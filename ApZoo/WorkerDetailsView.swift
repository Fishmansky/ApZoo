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
            Text("\(worker.name)")
            Form{
                Section(header: Text("Tasks")){
                    ForEach(0..<worker.Tasks.count, id: \.self){
                        Text(worker.Tasks[$0].description)
                    }
                }
            }
            Text("Currently working on: \(worker.currentTask())")
                    .font(.subheadline)
                    .foregroundColor(.gray)
        }
    }
}


//struct WorkerDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkerDetailsView()
//    }
//}
