//
//  SelectionView.swift
//  ApZoo
//
//  Created by Mac on 07/04/2021.
//

import SwiftUI

struct SelectionView: View {
    
    @EnvironmentObject var ObservedTM: TaskManager
    @Binding var passedTask: Task
    @Binding var isPresented: Bool
    var body: some View {
        VStack{
            HStack{
                Text("Assign task to")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.all, 10)
                Spacer()
                Button(action: {
                    isPresented = false
                }, label: {
                    Text("Cancel")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                })
                    .foregroundColor(.white)
                    .background(Color.red)
                    .frame(width: 100, height: 34)
                    .cornerRadius(10)
                    .padding(.all, 10)
            }
            List(ObservedTM.WorkerList) { worker in
                Button(action: {
                    ObservedTM.WorkerList[0].addTask(passedTask)
                    isPresented = false
                }, label: {
                    Text(worker.name)
                        .fontWeight(.semibold)
                })
            }
        }
    }
}

//struct SelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectionView()
//    }
//}
