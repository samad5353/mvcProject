//
//  MostViewedViewController.swift
//  NYTimes
//
//  Created by Samad on 9/7/19.
//  Copyright © 2019 Samad. All rights reserved.
//

import UIKit

class MostViewedViewController: UIViewController {

    lazy var mostViewed: MostRecent? = MostRecent()
    var news: [News]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        let smart : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "activityFeedFilter"), style: .plain, target: self, action: #selector(filterButtonClicked))
        self.navigationItem.rightBarButtonItem = smart
        activityIndicator.stopAnimating()
        makeMostViewedAPI()
    }
    
    private func makeMostViewedAPI(filter: String? = "7") {
        activityIndicator.startAnimating()
        mostViewed?.getMostViewedNews(filter: filter, completion: {(rexent, error) in
            if error != nil {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let cancel = UIAlertAction(title: "OK", style: .default, handler: { action in
                    alertController.dismiss(animated: true)
                })
                alertController.addAction(cancel)
                return
            }
            self.news = rexent?.mostViewed
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        })
    }
    
    @IBAction func filterButtonClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Filter", message: nil, preferredStyle: .actionSheet)
        let lastWeek = UIAlertAction(title: "Last Week", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
            self.makeMostViewedAPI(filter: "7")
        })
        
        let lastMonth = UIAlertAction(title: "Last Month", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
            self.makeMostViewedAPI(filter: "30")
        })
        
        let today = UIAlertAction(title: "Today", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
            self.makeMostViewedAPI(filter: "1")
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            self.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(lastWeek)
        alertController.addAction(lastMonth)
        alertController.addAction(today)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension MostViewedViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MostViewedTableViewCell") as? MostViewedTableViewCell else { return UITableViewCell() }
        cell.setupCell(with: news?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        viewController.news = news?[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
