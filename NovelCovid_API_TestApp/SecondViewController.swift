//
//  SecondViewController.swift
//  NovelCovid_API_TestApp
//
//  Created by Alex Nascimento on 03/04/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import UIKit

struct BrazilInformation: Codable {
    var cases: Int
    var deaths: Int
    var recovered: Int
    var updated: Int
    var active: Int
    var critical: Int
    var casesPerOneMillion: Int
    var deathsPerOneMillion: Int
    var todayCases: Int
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }

    func loadData() {
        if let url = URL(string: "https://corona.lmao.ninja/countries/brazil") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { print("No data found"); return }
                do {
                    let brInfo = try JSONDecoder().decode(BrazilInformation.self, from: data)
                    print("-----BRAZIL-----")
                    print("cases: \(brInfo.cases)")
                    print("todaycases: \(brInfo.todayCases)")
                    print("deaths: \(brInfo.deaths)")
                    print("recovered: \(brInfo.recovered)")
                    print("updated: \(getDateFrom(updated: brInfo.updated))")
                    print("active: \(brInfo.active)")
                    print("critical: \(brInfo.critical)")
                    print("casesPerOneMillion: \(brInfo.casesPerOneMillion)")
                    print("deathsPerOneMillion: \(brInfo.deathsPerOneMillion)")
                    DispatchQueue.main.async {
                        self.textView.text = "cases: \(brInfo.cases)\n"
                        self.textView.text += "todaycases: \(brInfo.todayCases)\n"
                        self.textView.text += "deaths: \(brInfo.deaths)\n"
                        self.textView.text += "recovered: \(brInfo.recovered)\n"
                        self.textView.text += "updated: \(getDateFrom(updated: brInfo.updated))\n"
                        self.textView.text += "active: \(brInfo.active)\n"
                        self.textView.text += "critical: \(brInfo.critical)\n"
                        self.textView.text += "casesPerOneMillion: \(brInfo.casesPerOneMillion)\n"
                        self.textView.text += "deathsPerOneMillion: \(brInfo.deathsPerOneMillion)\n"
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }


}

