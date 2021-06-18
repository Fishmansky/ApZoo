//
//  ChooseView.swift
//  ApZoo
//
//  Created by Mac on 10/06/2021.
//

import SwiftUI

struct ChooseView: View {
    @EnvironmentObject var ObservedTM: TaskManager
    var W_List: [Worker] {
        ObservedTM.WorkerList
    }
    var body: some View {
        NavigationView{
            VStack{
                Text("Choose worker")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                ScrollView{
                    ForEach(0..<W_List.count, id: \.self) { worker in
                        NavigationLink(
                            destination: WorkerView(worker: W_List[worker]),
                            label: {
                                ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
                                    Capsule()
                                        .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.WhiteBlue)
                                    Text("\(W_List[worker].Name)")
                                        .foregroundColor(.DarkBlue)
                                }
                                
                            })
                    }
                }
            }
        }
    }
}

struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseView()
    }
}
