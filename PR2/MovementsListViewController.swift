//
//  MovementsListViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementsListViewController: UITableViewController {
    
    // BEGIN-UOC-1
    
    // movementsStore: Array of Movement to store list of movements
    var movementsStore = [Movement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    
        // Load list of movements in array movementsStore
        movementsStore = Services.getMovements()

        tableView.rowHeight = 75
    }
    // END-UOC-1
    
    // BEGIN-UOC-3
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return movementsStore.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // It is a movement row (not last row)
        if (indexPath.row < (movementsStore.count-1) ) {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovementCell") as! MovementCell
            
            // Description
            let maxCharsPerLine = 30 // Maximum number of characters to prevent a line with incomplete text by length
            var movementDescription = movementsStore[indexPath.row].movementDescription
            if (movementDescription.count > maxCharsPerLine) {
                movementDescription = String(movementDescription.prefix(maxCharsPerLine)) + " (..)"
                }
            
            // Date
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-MM-dd"
            let movementDate = dateformatter.string(from: movementsStore[indexPath.row].date)
           
            // Amount
            // Format amount according to format XXXX,XX €
             let currencyFormatter = NumberFormatter()
            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .currency
            //currencyFormatter.locale not Locale.current. Forced to Spain to show amount in format XXXX,XX €
             currencyFormatter.locale = Locale(identifier: "es_ES")
            let movementAmount = currencyFormatter.string(from: movementsStore[indexPath.row].amount as NSDecimalNumber) ?? ""

            // Assign calculated strings to cell controls
            cell.movementDescription.text = movementDescription
            cell.movementDate.text = movementDate
            cell.movementAmount.text = movementAmount
            // Format color of amount. Red if negative.
            if movementAmount.contains("-") {
                cell.movementAmount.textColor = UIColor.red }
            else {
                cell.movementAmount.textColor = UIColor.black }
            
            return cell
            
            }
            
        // BEGIN-UOC-4
        // If It is the last row
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LastMovementCell") as!  LastMovementCell
            return cell
        }
        // END-UOC-4
        
    }
    // END-UOC-3
    
    // BEGIN-UOC-5
    // END-UOC-5
    
    // BEGIN-UOC-6.1
    // END-UOC-6.1
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}
