//
//  DetailViewController.swift
//  Bottle Rocket
//
//  Created by Pavitra on 24/07/20.
//  Copyright © 2020 Mahabaleshwar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailData: RestaurantDetails?
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
