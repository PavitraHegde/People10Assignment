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
    let activityIndicator = UIActivityIndicatorView()
    
    //MARK:- View Life Cycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showActivityIndicatory()
        self.initialSetup()
        
    }
}

// MARK: TableView Data source method

extension LunchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lunchItemInfo?.restaurants.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LunchCollectionViewCell", for: indexPath) as! LunchCollectionViewCell
        let lunchInfoData = lunchItemInfo?.restaurants[indexPath.row]
        cell.restaurantName.text = lunchInfoData?.name
        cell.category.text = lunchInfoData?.category
        self.downloadImage(lunchInfoData!.backgroundImageURL, indexPath: indexPath)
        return cell
    }
}

//MARK:- TableView Delegate method

extension LunchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailViewController", sender: lunchItemInfo?.restaurants[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController" {
            let vc = segue.destination as? DetailViewController
            vc?.detailData = sender as? RestaurantDetails
        }
    }
}

//MARK:- Initial Setup method

extension LunchViewController {
    
    func initialSetup() {
        let nib = UINib(nibName: "LunchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "LunchCollectionViewCell")
        let lunchInfoResult = RestaurantService()
        lunchInfoResult.fetchLunchItemList(completionHandler: { (error, response) in
            self.activityIndicator.stopAnimating()
            if let error = error {
                print(error)
            } else {
                self.lunchItemInfo = response
                self.collectionView.reloadData()
            }
        })
    }
}

extension LunchViewController {
    
    func downloadImage(_ url: URL, indexPath: IndexPath) {
        let imageDownloadManager = ImageDownloadManager()
        imageDownloadManager.downloadImage(url: url) {
            (image, error) in
            self.activityIndicator.stopAnimating()
            DispatchQueue.main.async {
                guard let cell = self.collectionView.cellForItem(at: indexPath) as? LunchCollectionViewCell else {
                    return
                }
                if let image = image {
                    cell.Item.image = image
                } else {
                    cell.Item.image = UIImage(named: "hopdoddy")
                }
            }
        }
    }
    
    func showActivityIndicatory() {
        let activityView = UIActivityIndicatorView(style: .medium)
           activityView.center = self.view.center
           self.view.addSubview(activityView)
           activityView.startAnimating()
       }
}


