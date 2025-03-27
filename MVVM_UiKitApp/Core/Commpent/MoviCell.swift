//
//  MoviCell.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 24.03.25.
//

import UIKit

class MoviCell: UICollectionViewCell {

    private var imageview : UIImageView!
    
    static let reuseID = "Movicell"
    override init(frame:CGRect) {
        super.init(frame: frame)
        configureCell()
        configureImageview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCell(){
        backgroundColor = .systemGray
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    private func configureImageview(){
        imageview = uiimage(frame: .zero)
        addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.backgroundColor = .red
        imageview.constrantGeneric(view: self)
    }
}
