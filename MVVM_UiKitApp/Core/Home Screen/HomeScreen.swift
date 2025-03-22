//
//  HomeScreen.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 18.03.25.
//

import UIKit

protocol HomeScreenP:AnyObject{
    func configrueVc()
    func configrueCollectionView()
}

final class HomeScreen: UIViewController{
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let vievModel = HomeVievModel()
    
    private var collectionView:UICollectionView! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        vievModel.view = self
        vievModel.vievDidLoad()
    }
}


extension HomeScreen:HomeScreenP{
    func configrueVc() {
        view.backgroundColor = .systemBackground
    }
    func configrueCollectionView() {
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
}
