//
//  MostViewedTableViewCell.swift
//  NYTimes
//
//  Created by Samad on 9/7/19.
//  Copyright © 2019 Samad. All rights reserved.
//

import UIKit
import AlamofireImage

class MostViewedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(with items: News?) {
        titleLabel.text = items?.title ?? ""
        subTitleLabel.text = items?.byLine ?? ""
        dateLabel.text = items?.publishedDate ?? ""
        newsImageView.image = nil
        guard let url = URL(string: items?.media?[0].image?[0].url ?? "") else { return }
        newsImageView.af_setImage(withURL: url)
    }
}
