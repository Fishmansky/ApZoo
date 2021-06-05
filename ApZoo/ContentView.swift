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
                        Label("Workers", systemImage: "list.dash")
                    }
                TasksView()
                    .tabItem {
                        Label("Tasks", systemImage: "list.dash")
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
