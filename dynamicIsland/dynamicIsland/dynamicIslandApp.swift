//
//  dynamicIslandApp.swift
//  dynamicIsland
//
//  Created by Kadir Aydınlı on 8.01.2023.
//

import SwiftUI

// MARK: Creating APNs Files
// Simply Create a new File with format .apns
// And Paste the Following Code
@main
struct dynamicIslandApp: App {
    // MARK: Linking App Delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .top) {
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        NotificationPreview(size: size)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
        }
    }
}

// MARK: App Delegate to Listen for In App Notifications
// Which Will Be Looking like it's Extracting From Dynamic Island
struct NotificationPreview: View {
    var size: CGSize
    var body: some View {
        HStack {
            
        }.frame(width: <#T##CGFloat?#>)
    }
}
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        if UIApplication.shared.haveDynamicIsland {
            // MARK: Do Animation
            print("DO ANIMATION")
            return [.sound]
        } else {
            // MARK: Normal Notification
            return [.sound, .banner]
        }
    }
}

extension UIApplication {
    var haveDynamicIsland: Bool {
        return deviceName == "iPhone 14 Pro" || deviceName == "iPhone 14 Pro Max"
    }
    
    var deviceName: String {
        return UIDevice.current.name
    }
}
