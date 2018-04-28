//
//  MovementDetailViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementDetailViewController: UIViewController {
    
    // BEGIN-UOC-6.1
    
    // movement variable to manage the detail movement
    var movement: Movement!
    
    // Label outlets for each movement detail
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueDateLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Amount according to format XXXX,XX €
        // Implemented Utils.FormatToStringDecimalToLocalCurrency function
        let amount = Utils.FormatDecimalToLocalCurrencyString(number: movement.amount)
        amountLabel.text = amount
        // Format amount color. Red if negative.
        if amount.contains("-") {
            amountLabel.textColor = UIColor.red }
        else {
            amountLabel.textColor = UIColor.black }
        
        // Description
        descriptionLabel.text = movement.movementDescription
        
        // Dates
        dateLabel.text = Utils.FormatDateToYYYY_MM_DD(date:  movement.date)
        valueDateLabel.text = Utils.FormatDateToYYYY_MM_DD(date: movement.valueDate)
        
        // Balance according to format XXXX,XX €
        // Implemented Utils.FormatToStringDecimalToLocalCurrency function
        let balance = Utils.FormatDecimalToLocalCurrencyString(number: movement.balance)
        balanceLabel.text = balance
        // Format color of balance. Red if negative.
        if balance.contains("-") {
            balanceLabel.textColor = UIColor.red }
        else {
            balanceLabel.textColor = UIColor.black }
        
        // If movement was rejected, show label and hide button
        if movement.rejected {
            rejectedLabel.textColor = UIColor.red
            rejectedLabel.isHidden = false
            rejectButton.isHidden = true
        }
    }
    
    // END-UOC-6.1
    
    // BEGIN-UOC-7
    // Outlet for "Rejected" label
    @IBOutlet weak var rejectedLabel: UILabel!
    @IBOutlet weak var rejectButton: UIButton!
    
    @IBAction func rejectAction(_ sender: UIButton!) {        

        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
        // Movement rejection
        movement.rejected = true
        
        // Rejected label visible. Reject button hidden.
        rejectedLabel.isHidden = false
        rejectButton.isHidden = true
    }
    // END-UOC-7    
}
