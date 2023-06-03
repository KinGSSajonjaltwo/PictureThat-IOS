//
//  PicturethatApp.swift
//  Picturethat
//
//  Created by Eric Lee on 2023/04/01.
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
struct PicturethatApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var savedCardsData = SavedCardsData()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(savedCardsData)
        }
    }
}
