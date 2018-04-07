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
    
        // Load list of movements
        movementsStore = Services.getMovements()
        
        for i in 0...movementsStore.count-1 {print(movementsStore[i].movementDescription)} //****>>>> BORRAR <<<<****

        tableView.rowHeight = 75
    }
    // END-UOC-1
    
    // BEGIN-UOC-3
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Number of sections 2 : Movements + Footer "End of movements"
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return movementsStore.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovementCell") as! MovementCell
        
        // Description
        let maxCharsPerLine = 40
        var movementDescription = movementsStore[indexPath.row].movementDescription
        if (movementDescription.count > maxCharsPerLine) {
            movementDescription = String(movementDescription.prefix(maxCharsPerLine)) + " (..)"
        }
        
        // Date
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        let movementDate = dateformatter.string(from: movementsStore[indexPath.row].date)
       
        // Amount
        let movementAmount = "1234" //String.init(format: "%.2d", movementsStore[indexPath.row].amount)
        
        cell.movementDescription.text = movementDescription
        cell.movementAmount.text = "1234"
        cell.movementDate.text = movementDate
        
        return cell
    
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
