//
//  ViewControllerB.swift
//  ProtocolTask
//
//  Created by Saideep Reddy Talusani on 9/10/24.
//

import UIKit

protocol SelectedCountry: AnyObject{
    func countryText(text: String)
}

class ViewControllerB: UIViewController, CountryList {
    
    var dataArray: [String] = []
    
    weak var delegate: SelectedCountry?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
      
    }
}

extension ViewControllerB: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "StateViewCell") as? StateViewCell else{return UITableViewCell()}
        let country = dataArray[indexPath.row]
        cell.countryTextLabel.text = country
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = dataArray[indexPath.row]
        delegate?.countryText(text: country)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
