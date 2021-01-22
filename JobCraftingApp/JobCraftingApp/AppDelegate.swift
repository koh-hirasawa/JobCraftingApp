//
//  AppDelegate.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    
    var delVectorArray:[[String]] = [[],[],[]]
    
//    stage1の問題切替がどうしてもできなくてAppDelegateに　要修正
   var quiz1Select = 0



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //最初の画面を表示する時間を1.8秒にする
        sleep(UInt32(1.8))
        
        // Override point for customization after application launch.
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

