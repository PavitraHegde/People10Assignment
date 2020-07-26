//
//  LunchCollectionViewCell.swift
//  Bottle Rocket
//
//  Created by Pavitra on 23/07/20.
//  Copyright © 2020 Mahabaleshwar. All rights reserved.
//

import UIKit

class LunchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var Item: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var category: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
