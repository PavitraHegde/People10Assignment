//
//  LunchViewController.swift
//  Bottle Rocket
//
//  Created by Pavitra on 23/07/20.
//  Copyright © 2020 Mahabaleshwar. All rights reserved.
//

import UIKit

class LunchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var lunchItemInfo: RestaurantDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        
    }
    
}

extension LunchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lunchItemInfo?.restaurants.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LunchCollectionViewCell", for: indexPath) as! LunchCollectionViewCell
        let lunchInfoData = lunchItemInfo?.restaurants[indexPath.row]
        cell.restaurantName.text = lunchInfoData?.name
        cell.category.text = lunchInfoData?.category
        
        return cell
        
    }
    
    
}


extension LunchViewController: UICollectionViewDelegate {
    
}

extension LunchViewController {
    func initialSetup() {
        let nib = UINib(nibName: "LunchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "LunchCollectionViewCell")
        let lunchInfoResult = RestaurantService()
        lunchInfoResult.fetchLunchItemList(completionHandler: { (error, response) in
            if let error = error {
                print(error)
            } else {
                self.lunchItemInfo = response
                self.collectionView.reloadData()
            }
        })
    }
}
