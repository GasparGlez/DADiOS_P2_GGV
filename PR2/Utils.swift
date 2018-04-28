//
//  Utils.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static func show(Message message: String, WithTitle title: String, InViewController viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    // GGV-BEGIN - Format functions
    // Function: FormatDecimalToLocalCurrencyString
    // Description: Format amount according a given format locale currency. If is not provided a locale settings, default locale = "es_ES"
    static func FormatDecimalToLocalCurrencyString(number: Decimal, locale: String?=nil) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: locale ?? "es_ES")
        return currencyFormatter.string(from: number as NSDecimalNumber) ?? ""
    }
    // Function: FormatDateToYYYY_MM_DD
    // Description: Format date to a "yyyy-MM-dd" string
    static func FormatDateToYYYY_MM_DD(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateformatter.string(from: date)
        return formattedDate
    }
    // GGV-END
}

extension UIColor {
    func lighter(by percentage: CGFloat = 80.0) -> UIColor {
        return self.adjustBrightness(by: abs(percentage))
    }
        func darker(by percentage: CGFloat = 80.0) -> UIColor {
        return self.adjustBrightness(by: -abs(percentage))
    }
    
    func adjustBrightness(by percentage: CGFloat = 30.0) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            if b < 1.0 {
                let newB: CGFloat = max(min(b + (percentage/100.0)*b, 1.0), 0,0)
                return UIColor(hue: h, saturation: s, brightness: newB, alpha: a)
            } else {
                let newS: CGFloat = min(max(s - (percentage/100.0)*s, 0.0), 1.0)
                return UIColor(hue: h, saturation: newS, brightness: b, alpha: a)
            }
        }
        return self
    }
}


