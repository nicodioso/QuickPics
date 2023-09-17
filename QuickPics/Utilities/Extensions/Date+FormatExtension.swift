//
//  Date+Extension.swift
//  QuickPics
//
//  Created by Nico Dioso on 9/18/23.
//

import Foundation

extension Date {
    
    func toString(format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        
        return formatter.string(from: self)
    }
}

enum DateFormat: String {
    case short = "MMM d, YYYY"
}
