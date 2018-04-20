//
//  MovementsListViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementsListViewController: UITableViewController {
    
    // BEGIN-UOC-1
    
    // movementsStore: Array of Movement to store list of movements. Loaded from getMovements() function
    var movementsStore = [Movement]()
    
    // Today string (formatted date)
    let todayDate = Services.FormatDateToYYYY_MM_DD(date: Date())
    
    // Selector : 0: All movements (default) / 1: Today movements (filtered)
    var selector = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    
        // Load list of movements into movementsStore array
        movementsStore = Services.getMovements()
        
        // Table row height
        tableView.rowHeight = 75
        //
    }
    // END-UOC-1
    
    // BEGIN-UOC-3
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows/movements + 1 (last "End of movements" row)
        var numOfRows : Int
        // If selector=0 then show all movements: numOfRows = movementsStore.count
        if (selector == 0) {numOfRows = movementsStore.count}
            // Else (selector=1) show only today elements: numOfRows = (movementsStore.count when  movementsStore[i].date=todayDate)
        else {
            numOfRows = 0
            for i in 0..<(movementsStore.count-1) {
                if (Services.FormatDateToYYYY_MM_DD(date: movementsStore[i].date) == todayDate) {
                    numOfRows+=1
                    }
                }
        }
        return numOfRows + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // It is a movement row (not last row)
        if (indexPath.row < (movementsStore.count) &&
            ( // Selection of rows: selector=0 (all elements) OR selector=1 and movementsStore[indexPath.row].date=todayDate)
                (selector == 0) || (selector == 1 && Services.FormatDateToYYYY_MM_DD(date: movementsStore[indexPath.row].date) == todayDate)
                )
            ) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovementCell") as! MovementCell
            
            // Description
            let maxCharsPerLine = 30 // Maximum number of characters to prevent a line with incomplete text by length
            var movementDescription = movementsStore[indexPath.row].movementDescription
            if (movementDescription.count > maxCharsPerLine) {
                movementDescription = String(movementDescription.prefix(maxCharsPerLine)) + " (..)"
                }
            
            // Date
            let movementDate = Services.FormatDateToYYYY_MM_DD(date: movementsStore[indexPath.row].date)
            
            // Amount
            // Format amount according to format XXXX,XX €
            // Implemented Services.FormatToStringDecimalToLocalCurrency function
            let movementAmount = Services.FormatDecimalToLocalCurrencyString(number: movementsStore[indexPath.row].amount)
            
            // Assign calculated strings to cell controls
            cell.movementDescription.text = movementDescription
            cell.movementDate.text = movementDate
            cell.movementAmount.text = movementAmount
            
            // Format color of amount. Red if negative.
            if movementAmount.contains("-") {
                cell.movementAmount.textColor = UIColor.red }
            else {
                cell.movementAmount.textColor = UIColor.black }

            // If It is a rejected movement change background color
            if (movementsStore[indexPath.row].rejected == true) {
                cell.backgroundColor = UIColor.orange.lighter()
            }
            else {
                cell.backgroundColor = UIColor.white
            }
            
            return cell
        }
        // BEGIN-UOC-4
        // If it is the last row, add a "LastMovementCell" cell type.
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LastMovementCell") as!  LastMovementCell
            return cell
        }
        // END-UOC-4
        
    }
    // END-UOC-3
    
    // BEGIN-UOC-5
    // segmentedFilter outlet
    @IBOutlet weak var segmentedFilter: UISegmentedControl!
    
    @IBAction func valueChangedSegmentedFilter(_ sender: Any) {

        // Update selector variable with user's selection
        selector = segmentedFilter.selectedSegmentIndex
        
        // Reload data
        tableView.reloadData()
    }
    
    // END-UOC-5
    
    // BEGIN-UOC-6.2
    
    // Function to "prepare" segue to MovementDetailViewController from selected cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If get the destination controller, cast it to detail class
        if let destinationController  = segue.destination as? MovementDetailViewController {
            // Set movement variable in MovementDetailViewController with selected cell value
            destinationController.movement = movementsStore[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

    // END-UOC-6.2
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
