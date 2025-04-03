//
//  UICollectionView.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 30.03.25.
//

import UIKit

extension UICollectionView{
    func reoldOnMainTherad(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
