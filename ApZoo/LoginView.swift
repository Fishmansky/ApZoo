//
//  LoginView.swift
//  ApZoo
//
//  Created by Mac on 11/04/2021.
//

import Combine
import SwiftUI

struct LoginView: View {
    @Binding var isLogged: Bool
    @Binding var user: String
    @State var password = ""
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.5725490196, green: 0.862745098, blue: 0.8980392157, alpha: 1)).ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 24){
                Text("ApZoo")
                    .bold()
                    .font(.system(size: 50))
                Text("Login")
                    .fontWeight(.bold)
                TextField("Your login", text: $user)
                    .autocapitalization(.none)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 30, alignment: .center)
                    .font(.system(size: 15, weight: .semibold))
                TextField("Password", text: $password)
                    .autocapitalization(.none)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 30, alignment: .center)
                    .font(.system(size: 15, weight: .semibold))
            }
        }
    }
}

struct LoggedView: View {
    @Binding var loggedUser: String
    @EnvironmentObject var ObservedTM: TaskManager
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
        .environmentObject(ObservedTM)
    }
}

struct HomeView: View {
    @EnvironmentObject var ObservedTM: TaskManager
    @State var isLogged = false
    @State var userLogged = ""
    var body: some View {
        if isLogged == false {
            LoginView(isLogged: $isLogged, user: $userLogged)
        } else {
            LoggedView(loggedUser: $userLogged)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
