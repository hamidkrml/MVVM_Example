//
//  MoviCell.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 24.03.25.
//

import UIKit

class MoviCell: UICollectionViewCell {

    static let reuseID = "Movicell"
    override init(frame:CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCell(){
        backgroundColor = .systemGray
        layer.cornerRadius = 8
    }
}
