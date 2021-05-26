//
//  ManagerView.swift
//  ApZoo
//
//  Created by Mac on 22/05/2021.
//

import SwiftUI
import Combine

struct ManagerView: View {
    @StateObject var ObservedTM = TaskManager()
    var body: some View {
        VStack(alignment: .center){
            TabView{
                WorkersViewDev()
                    .tabItem {
                        Label("Workers", systemImage: "list.dash")
                    }
                TasksView()
                    .tabItem {
                        Label("Tasks", systemImage: "list.dash")
                    }
            }
        }
        .environmentObject(ObservedTM)
    }
}

struct ManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
