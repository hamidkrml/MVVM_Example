//
//  ViewController.swift
//  MVVM_UiKitApp
//
//  Created by hamid on 18.03.25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional sxetup after loading the view.
        apicagirisi()
    }

    func apicagirisi(){
        DispatchQueue.main.async{
            NetworkManeger.shared.popularMovies { result in
                switch result{
                case .success(let success):
                    success.forEach { comment in
                        print(comment.id)
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
                
            }
        }
    }
}

