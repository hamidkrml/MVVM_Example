//
//  HomeVievModel.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 21.03.25.
//

import Foundation
 
protocol HomeVievModelP{
    var view: HomeScreenP? { get set }
    func vievDidLoad()
}




final class HomeVievModel{
    weak var view:HomeScreenP?
    
}




extension HomeVievModel:HomeVievModelP{
    func vievDidLoad() {
        view?.configrueVc()
        view?.configrueCollectionView()
    }
   
}
