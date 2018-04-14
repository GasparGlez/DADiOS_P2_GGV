//
//  MovementDetailViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementDetailViewController: UIViewController {

    
    // BEGIN-UOC-6.1
    
    var movement: Movement!
    
    // Label outlets for each movement detail
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueDateLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Amount formatted
        let amount = Services.FormatToStringDecimalToLocalCurrency(number: movement.amount)
        amountLabel.text = amount
        // Format color of amount. Red if negative.
        if amount.contains("-") {
            amountLabel.textColor = UIColor.red }
        else {
            amountLabel.textColor = UIColor.black }
        
        // Description
        descriptionLabel.text = movement.movementDescription
        
        // Dates
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        dateLabel.text = dateformatter.string(from: movement.date)
        valueDateLabel.text = dateformatter.string(from: movement.valueDate)
        
        // Amount formatted
        let balance = Services.FormatToStringDecimalToLocalCurrency(number: movement.balance)
        balanceLabel.text = balance
        // Format color of balance. Red if negative.
        if balance.contains("-") {
            balanceLabel.textColor = UIColor.red }
        else {
            balanceLabel.textColor = UIColor.black }
    }
    
    // END-UOC-6.1
    
    // BEGIN-UOC-7
    func rejectAction(sender: UIButton!) {        
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    // END-UOC-7    
}
