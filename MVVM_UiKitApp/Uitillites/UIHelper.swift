//
//  UIHelper.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 22.03.25.
//


import UIKit

enum UIHelper{
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        // cihazin within alidik
        let itemWith = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        
            //genisligi cihizin genisligi kadar olacak uzunlugu ise genisligin 1.5 kadar olacak 
        layout.itemSize = CGSize(width: itemWith, height: itemWith * 1.5 )
        
        return layout
    }
}
