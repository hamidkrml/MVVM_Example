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
    private let vievModel = HomeVievModel()
    
    private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vievModel.view = self
        vievModel.vievDidLoad()
    }
}


extension HomeScreen:HomeScreenP{
    func configrueVc() {
        view.backgroundColor = .systemGray2
    }
    func configrueCollectionView() {
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MoviCell.self, forCellWithReuseIdentifier: MoviCell.reuseID)
        collectionView.constrantGeneric(view: view)
        collectionView.backgroundColor = .clear
    }
}
//#Preview{
//    HomeScreen()
//}


extension HomeScreen : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vievModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviCell.reuseID, for: indexPath) as! MoviCell
        
        cell.setcell(movie: vievModel.movies[indexPath.item])
            
        return cell
    }
    
    
}
