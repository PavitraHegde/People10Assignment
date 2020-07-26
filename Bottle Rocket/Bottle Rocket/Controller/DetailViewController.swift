//
//  DetailViewController.swift
//  Bottle Rocket
//
//  Created by Pavitra on 24/07/20.
//  Copyright © 2020 Mahabaleshwar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailData: Restaurant?
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var twitter: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = detailData?.name
        category.text = detailData?.category
        address.text = detailData?.location.formattedAddress.joined(separator: ",")
        phone.text = detailData?.contact?.phone
        twitter.text = detailData?.contact?.twitter
        
    }
    
    
}
