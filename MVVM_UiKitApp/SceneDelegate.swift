//
//  SceneDelegate.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 18.03.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScen = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScen.coordinateSpace.bounds)
        window?.windowScene = windowScen
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }

}

