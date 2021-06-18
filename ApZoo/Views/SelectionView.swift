//
//  SelectionView.swift
//  ApZoo
//
//  Created by Mac on 07/04/2021.
//

import SwiftUI

struct SelectionView: View {
    @EnvironmentObject var ObservedTM: TaskManager
    var passedTask: Task
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
                        .fontWeight(.semibold)
                        .frame(width: 85, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.red)
                        .foregroundColor(.white)
                })
                    .cornerRadius(8)
                    .padding(.all, 10)
            }
            List(ObservedTM.WorkerList) { worker in
                Button(action: {
                    worker.addTask(passedTask)
                    ObservedTM.releaseTask(passedTask)
                    isPresented = false
                }, label: {
                    Text(worker.Name)
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
