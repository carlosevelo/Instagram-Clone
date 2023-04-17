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
    
    @StateObject var authService = AuthService()
    @StateObject var profileData = ProfileDataModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if authService.signedIn {
                    MainView()
                } else {
                    SignInView()
                }
            }
            .navigationViewStyle(.stack)
            .environmentObject(authService)
            .environmentObject(profileData)
        }
    }
}
