//
//  FirstViewController.swift
//  NovelCovid_API_TestApp
//
//  Created by Alex Nascimento on 03/04/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

// the docs for the API: https://corona.lmao.ninja/docs/
// how to use curl: https://flaviocopes.com/http-curl/
import UIKit

struct GlobalInformation: Codable {
    var cases: Int
    var deaths: Int
    var recovered: Int
    var updated: Int
    var active: Int
    var affectedCountries: Int
}

class FirstViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData() {
        if let url = URL(string: "https://corona.lmao.ninja/all") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { print("No data found"); return }
                do {
                    let globalInfo = try JSONDecoder().decode(GlobalInformation.self, from: data)
                    print("-----GLOBAL-----")
                    print("cases: \(globalInfo.cases)")
                    print("deaths: \(globalInfo.deaths)")
                    print("recovered: \(globalInfo.recovered)")
                    print("updated: \(getDateFrom(updated: globalInfo.updated))")
                    print("active: \(globalInfo.active)")
                    print("affectedCountries: \(globalInfo.affectedCountries)")
                    DispatchQueue.main.sync {
                        self.textView.text = "cases: \(globalInfo.cases)\n"
                        self.textView.text += "deaths: \(globalInfo.deaths)\n"
                        self.textView.text += "recovered: \(globalInfo.recovered)\n"
                        self.textView.text += "updated: \(getDateFrom(updated: globalInfo.updated))\n"
                        self.textView.text += "active: \(globalInfo.active)\n"
                        self.textView.text += "affectedCountries: \(globalInfo.affectedCountries)\n"
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }

}

