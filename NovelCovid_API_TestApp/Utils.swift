//
//  Utils.swift
//  NovelCovid_API_TestApp
//
//  Created by Alex Nascimento on 03/04/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

import Foundation

func getDateFrom(updated: Int) -> String {
    // transform milliseconds updated data into a Date
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    let date = Date(timeIntervalSince1970: TimeInterval(updated/1000))
    return dateFormatter.string(from: date)
}
