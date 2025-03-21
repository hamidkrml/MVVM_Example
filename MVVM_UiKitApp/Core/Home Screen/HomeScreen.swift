//
//  HomeScreen.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 18.03.25.
//

import UIKit

protocol HomeScreenP{
    
}



final class HomeScreen: UIViewController{

    private let vievModel = HomeVievModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vievModel.view = self
        vievModel.vievDidLoad()
    }
}


extension HomeScreen:HomeScreenP{
    
}
