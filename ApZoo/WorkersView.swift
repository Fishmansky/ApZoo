//
//  WorkersView.swift
//  ApZoo
//
//  Created by Mac on 09/04/2021.
//

import SwiftUI

struct WorkersViewDev: View {
    @State var newName = ""
    @State var isPresentingWorkerView = false
    @EnvironmentObject var ObservedTM: TaskManager
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.6182629615, green: 1, blue: 0.8307533205, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Workers")
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 10) {
                    List(ObservedTM.WorkerList) { worker in
                            Button(action: {
                                isPresentingWorkerView.toggle()
                            }, label: {
                                worker.ViewBlock()
                            })
                            .sheet(isPresented: $isPresentingWorkerView, content: {
                                WorkerDetailsViewDev(isPresented: $isPresentingWorkerView, worker: worker)
                            })
                    }
                    .colorMultiply(Color(#colorLiteral(red: 0.6182629615, green: 1, blue: 0.8307533205, alpha: 1)))
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
                }
                .padding()
                
            }
        }
        .environmentObject(ObservedTM)
    }
}

struct WorkersView: View {
    @State var newName = ""
    @State var isPresentingWorkerView = false
    @EnvironmentObject var ObservedTM: TaskManager
    
    var body: some View {
        NavigationView {
            VStack{
                List(ObservedTM.WorkerList) { worker in
                    NavigationLink(
                        destination: WorkerDetailsView(isPresented: $isPresentingWorkerView, worker: worker),
                        label: {
                            VStack(alignment: .leading) {
                                    Text(worker.name)
                                Text("Currently working on: \(worker.currentTaskDescription())")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                            }
                        })
                }
                .navigationTitle("Workers")
                .navigationBarTitleDisplayMode(.large)
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
                }
                .padding()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct WorkersView_Previews: PreviewProvider {
    static var previews: some View {
        WorkersViewDev()
    }
}
