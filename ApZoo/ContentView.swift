//
//  ContentView.swift
//  ApZoo
//
//  Created by Mac on 14/03/2021.
//

import Combine
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center){
            TabView{
                WorkersView()
                    .tabItem {
                        Label("Workers", systemImage: "person.3.fill")
                    }
                TasksView()
                    .tabItem {
                        Label("Tasks", systemImage: "list.dash")
                    }
                ChooseView()
                    .tabItem {
                        Label("Tasks", systemImage: "person.fill")
                    }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
