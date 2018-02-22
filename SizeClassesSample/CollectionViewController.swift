//
//  CollectionViewController.swift
//  SizeClassesSample
//
//  Created by Manikandan r on 20/02/18.
//  Copyright © 2018 Manikandan R. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "CollectionViewCell")
        // Do any additional setup after loading the view.
    }
    

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        collectionView.reloadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { (context) in
            self.collectionView.reloadData()
        })
    }

}

extension CollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        cell.backgroundColor = indexPath.item/2 == 0 ? UIColor.black : UIColor.brown
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if traitCollection.horizontalSizeClass == .compact {
            return CGSize(width: view.bounds.size.width - 40, height: 100)
        } else {
            let width:CGFloat
            if (collectionView.bounds.width - 80) / 3 < 300 {
                width = (collectionView.bounds.width - 60) / 2
            } else {
                width = (collectionView.bounds.width - 80) / 3
            }
            return CGSize(width: width, height: 100)
        }
    }
    

}
