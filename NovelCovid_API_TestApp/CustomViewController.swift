//
//  CustomViewController.swift
//  NovelCovid_API_TestApp
//
//  Created by Alex Nascimento on 03/04/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func request(_ sender: Any) {
        if textField.text == "" {
            loadData(urlString: textField.placeholder); return
        }
        loadData(urlString: textField.text)
    }
    
    func loadData(urlString: String?) {
        guard let urlString = urlString else { return }
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard let data = data else { print("No data found"); return }
                if let str = String(bytes: data, encoding: .ascii) {
                    print(str)
                    DispatchQueue.main.sync {
                        self.textView.text = str
                    }
                } else {
                    let nilerror = "string found nil"
                    print(nilerror)
                }
            }
            task.resume()
        }
    }
}


