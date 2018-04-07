//
//  MovementCellTableViewCell.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementCell: UITableViewCell {
    // BEGIN-UOC-2

    @IBOutlet weak var movementCellView: UIView!
    // Movement cell Outlets
    @IBOutlet weak var movementDescription: UILabel!
    @IBOutlet weak var movementDate: UILabel!
    @IBOutlet weak var movementAmount: UILabel!
    
    // END-UOC-2
}
