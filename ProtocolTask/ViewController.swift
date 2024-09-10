//
//  ViewController.swift
//  ProtocolTask
//
//  Created by Saideep Reddy Talusani on 9/10/24.
//

import UIKit

protocol CountryList{
    var dataArray: [String]{ get set }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var selectedTextLabel: UILabel!
    
    var listOfCountries: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    
    func initialSetup(){
        let path = Bundle.main.path(forResource: "CountryList", ofType: "plist")
        let arrayOfCountries = NSArray(contentsOfFile: path!)
        if let countries = arrayOfCountries as? [String]{
            listOfCountries = countries
        }
    }
    
    @IBAction func sendingData(_ sender: UIButton) {
        guard let data = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerB") as? ViewControllerB else {return}
        data.dataArray = listOfCountries
        data.delegate = self
        self.navigationController?.pushViewController(data, animated: true)
    }
}

extension ViewController: SelectedCountry{
    func countryText(text: String) {
        selectedTextLabel.text = "Country:  \(text)"
    }
    
}
