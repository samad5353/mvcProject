//
//  DetailViewController.swift
//  NYTimes
//
//  Created by Samad on 9/8/19.
//  Copyright © 2019 Samad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var newsDetails: UITextView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitle.text = news?.title ?? ""
        newsDate.text =  news?.publishedDate ?? ""
        newsDetails.text = news?.abstract ?? ""
    }
}
