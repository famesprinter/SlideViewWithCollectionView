//
//  ViewController.swift
//  SlideViewWithCollectionView
//
//  Created by Kittitat Rodphotong on 12/23/2559 BE.
//  Copyright © 2559 DevGo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variable
    let CVCellIdentifier = "CollectionViewCell"

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CVCellIdentifier,
                                                      for: indexPath)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w: CGFloat = (collectionView.bounds.size.width)-50
        let h: CGFloat = (collectionView.bounds.size.height)-64
        return CGSize(width: w, height: h)
    }
}

