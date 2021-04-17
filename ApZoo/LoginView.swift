//
//  LoginView.swift
//  ApZoo
//
//  Created by Mac on 11/04/2021.
//

import Combine
import SwiftUI

struct LoginView: View {
    @ObservedObject var ApLogger = Logger()
//    @EnvironmentObject var Logger: ApLogger
    @Binding var isLogged: Bool
    @Binding var user: String
    @State var password = ""
    var body: some View {
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
            Button(action: {
                if ApLogger.login(login: user, password: password) {
                    isLogged = true
                }
            }, label: {
                Text("Log in")
                    .fontWeight(.bold)
                    .frame(width: 90, height: 40, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            })
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