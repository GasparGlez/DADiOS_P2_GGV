//
//  PACServices.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import Foundation

class Services {
    static var storedMovements: [Movement]?
    
    static func validate(username: String, password: String) -> Bool {
        if (username == "uoc" && password == "1234") {
            return true;
        } else {
            return false;
        }
    }
    
    static func validate(code: String) -> Bool {
        if (code == "1234") {
            return true;
        } else {
            return false;
        }
    }
    
    static func calculateFinalAmount(ForAmount amount: Float, WithInterest interest: Double, AndYears years: Double) -> Double {
        let final = Double(amount) * pow(1 + Double(interest), Double(years))
        
        return final
    }
    
    static func getMovements() -> [Movement] {
        // Provide a seed to generate predictable but random Movements
        srandom(10)
        
        if let movements = storedMovements {
            return movements
        } else {
            Services.storedMovements = [Movement]()
            
            for i:Int in 1...50 {
                var date: Date
                
                if i <= 4 {
                    date = Date()
                } else {
                    date = Calendar.current.date(byAdding: .day, value: -i, to: Date()) ?? Date()
                }
                let movement = Movement(random: true, date: date)
                Services.storedMovements?.append(movement)
            }
            
            return Services.storedMovements ?? [Movement]()
        }
    }
    
    // GGV- BEGIN
    // Function: FormatToStringDecimalToLocalCurrency
    // Description: Format amount according a given format locale currency. If is not provided a locale settings, default locale = "es_ES"
    static func FormatToStringDecimalToLocalCurrency(number: Decimal, locale: String?=nil) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: locale ?? "es_ES")
        return currencyFormatter.string(from: number as NSDecimalNumber) ?? ""
    }
    // GGV-END
}
