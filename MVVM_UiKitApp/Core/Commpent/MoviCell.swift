//
//  MoviCell.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 24.03.25.
//

import UIKit

class MoviCell: UICollectionViewCell {

    private var imageview : uiimage!
    
    static let reuseID = "Movicell"
    override init(frame:CGRect) {
        super.init(frame: frame)
        configureCell()
        configureImageview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageview.image = nil
    }
    
    func setcell(movie:MovieResult){
        imageview.downloadImage(movie: movie)
    }
    
    
    
    func configureCell(){
        backgroundColor = .systemGray
        layer.cornerRadius = 16
        clipsToBounds = true  // tasdigindan dolayi moviecell 16 radius verilip amma configureImageview func olmadigindan dolayi tasiyor
    }
    private func configureImageview(){
        imageview = uiimage(frame: .zero)
        addSubview(imageview)
      //  imageview.translatesAutoresizingMaskIntoConstraints = false  \\ uiimage init func icersinde false cekilde
        imageview.constrantGeneric(view: self)
    }
}
