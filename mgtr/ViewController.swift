//
//  ViewController.swift
//  mgtr
//
//  Created by Zafar ‎ on 17/04/2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var countriesTableView: UITableView!
    struct Constants {
        static let cellIdentifier = "MagicCountryCell"
    }
    var countries = ["Chine","Brazil","Australia","Canada","USA", "Pakistan", "Germany"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countries.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for:indexPath)
        var tableViewCellConfi = tableViewCell.defaultContentConfiguration()
        tableViewCellConfi.text = countries[indexPath.row]
        tableViewCell.contentConfiguration = tableViewCellConfi
        return tableViewCell
    }
    
    
}
