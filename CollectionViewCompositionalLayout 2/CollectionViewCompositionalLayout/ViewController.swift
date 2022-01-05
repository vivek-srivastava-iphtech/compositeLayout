//
//  ViewController.swift
//  CollectionViewCompositionalLayout
//
//  Created by vivek shrivastwa on 03/01/22.
//

import UIKit



class ViewController: UIViewController {

    //MARK: - Variables
    private let collectView:UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayout.createCompositionalLayout())
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    //MARK: - lifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectView)
        collectView.frame = view.bounds
        collectView.register(CompositionalCollectionViewCell.self, forCellWithReuseIdentifier: CompositionalCollectionViewCell.identifier)
        collectView.delegate = self
        collectView.dataSource = self
        
    }
    
}

//MARK: - Extension
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompositionalCollectionViewCell.identifier, for: indexPath) as! CompositionalCollectionViewCell
        cell.setImageData(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PresentationViewController") as! PresentationViewController
        vc.image = Constants.shared.images[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                willDisplay cell: UICollectionViewCell,
                                forItemAt indexPath: IndexPath) {
       cell.alpha = 0
       UIView.animate(withDuration: 0.8) {
           cell.alpha = 1
       }
   }
}


