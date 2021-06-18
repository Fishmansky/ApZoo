//
//  ApZooApp.swift
//  ApZoo
//
//  Created by Mac on 14/03/2021.
//

import Combine
import SwiftUI

@main
struct ApZooApp: App {
    @StateObject var ObservedTM = TaskManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ObservedTM)
        }
    }
}
