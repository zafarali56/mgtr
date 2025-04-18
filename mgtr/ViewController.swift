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
    var countries = ["China","Brazil","Australia","Canada","USA", "Pakistan", "Germany"
    ]
    var continentsCountryMapping : Dictionary<String, String> = ["China":"Asia","Brazil":"South America","Australia":"Australia","Canada":"North America","USA":"North America", "Pakistan":"Asia", "Germany":"Germany"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
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
        var countryNames = countries[indexPath.row]
        tableViewCellConfi.text = countryNames
        tableViewCellConfi.secondaryText = continentsCountryMapping[countryNames] ?? ""
        tableViewCell.contentConfiguration = tableViewCellConfi
        return tableViewCell
    }
    
    
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User tapped on cell at \(indexPath) index path")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailViewController = UIViewController()
        detailViewController.view.backgroundColor = .gray
        detailViewController.modalPresentationStyle = .fullScreen
       
        performSegue(withIdentifier: "showCountryDetail", sender: self)
    }
}
