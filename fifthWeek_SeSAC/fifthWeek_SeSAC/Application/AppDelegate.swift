//
//  AppDelegate.swift
//  fifthWeek_SeSAC
//
//  Created by 박신영 on 1/20/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        //안에서 사용되는 UILabel의 모든 font를 bold 13으로 디폴트 설정하는 것.
//        UILabel.appearance().font = .boldSystemFont(ofSize: 13)
//        
//        //모든 navigationBar의 tintColor를 black으로 설정
//        UINavigationBar.appearance().tintColor = .black
//        
//        UIView.appearance().backgroundColor = .white
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

