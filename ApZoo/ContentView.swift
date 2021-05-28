//
//  ContentView.swift
//  ApZoo
//
//  Created by Mac on 14/03/2021.
//

import Combine
import SwiftUI

struct ContentView: View {
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
