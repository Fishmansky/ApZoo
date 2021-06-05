//
//  WorkersView.swift
//  ApZoo
//
//  Created by Mac on 09/04/2021.
//

import SwiftUI

struct WorkersView: View {
    @State var newName = ""
    @State var isClicked = false
    @State var isPresentingWorkerView = false
    @EnvironmentObject var ObservedTM: TaskManager
    
    var W_List: [Worker] {
        ObservedTM.WorkerList
    }
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Workers")
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 25))
                    })
                    .padding()
                }
                VStack(alignment: .leading, spacing: 10) {
                    ScrollView(showsIndicators: false){
                        ForEach(0..<W_List.count , id: \.self){ worker in
                            WorkerBlock(worker: W_List[worker], IsClicked: isClicked)
                        }
                    }
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
                }.padding()
            }
        }
        .environmentObject(ObservedTM)
    }
}

struct WorkersView_Previews: PreviewProvider {
    static var previews: some View {
        WorkersView()
    }
}
