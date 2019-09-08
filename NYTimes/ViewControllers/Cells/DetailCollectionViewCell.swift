//
//  DetailCollectionViewCell.swift
//  NYTimes
//
//  Created by Samad on 9/8/19.
//  Copyright © 2019 Samad. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    
    func setupCell(with items: Images?) {
        newsImageView.image = nil
        guard let url = URL(string: items?.url ?? "") else { return }
        newsImageView.af_setImage(withURL: url)
    }
}
