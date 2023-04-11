//
//  Instagram_CloneApp.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Instagram_CloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if authViewModel.signedIn {
                    HomeView()
                } else {
                    SignInView()
                }
            }
            .navigationViewStyle(.stack)
            .environmentObject(authViewModel)
        }
    }
}
