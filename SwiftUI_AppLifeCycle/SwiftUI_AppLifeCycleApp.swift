//
//  SwiftUI_AppLifeCycleApp.swift
//  SwiftUI_AppLifeCycle
//
//  Created by trungnghia on 22/06/2023.
//

///https://www.fivestars.blog/articles/app-delegate-scene-delegate-swiftui/

import SwiftUI

@main
struct SwiftUI_AppLifeCycleApp: App {
    //@Environment(\.scenePhase) private var scenePhase

//    init() {
//        print("This is the same as didFinishLaunchingWithOptions")
//    }

    @UIApplicationDelegateAdaptor var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .onChange(of: scenePhase) { phase in
//            switch phase {
//            case .background:
//                print("on background")
//            case .inactive:
//                print("on inactive")
//            case .active:
//                print("on active")
//            @unknown default:
//                print("on unknown")
//            }
//        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {

    @Published var date: Date = .now

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("didFinishLaunchingWithOptions....")

        // 👇🏻 Publishes every second
        Timer
            .publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .assign(to: &$date)

        return true
    }

    // Add scene delegate
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }


    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate...")
    }
}

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("sceneDidBecomeActive...")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("sceneWillResignActive...")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("sceneDidEnterBackground...")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("sceneWillEnterForeground...")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("sceneDidDisconnect...")
    }
}
