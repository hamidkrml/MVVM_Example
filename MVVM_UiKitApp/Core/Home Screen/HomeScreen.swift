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
    func reloadCollectionView()
    func navigationToDetail(movie : MovieResult)
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
        view.backgroundColor = .systemBackground
        title = "TMDB Series MVVM"
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
    func reloadCollectionView() {
       
        collectionView.reoldOnMainTherad()
            
     
            
        
    }
    func navigationToDetail(movie : MovieResult) {
        DispatchQueue.main.async{
            let detailScren = DetailScreen(movie: movie)
            self.navigationController?.pushViewController(detailScren, animated: true)
        }
        
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vievModel.DetailfotoDownload(id: vievModel.movies[indexPath.item]._id)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let ofsety = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if ofsety >= contentHeight - (2 * height) {
            vievModel.fotoDownload()
        
        }
    }
    
}
