//
//  UIViewExt.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 22.03.25.
//
import UIKit

extension UIView {
    func constrantGeneric(view:UIView){
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}
