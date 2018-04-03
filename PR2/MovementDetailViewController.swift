//
//  MovementDetailViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementDetailViewController: UIViewController {
    // BEGIN-UOC-5
    var movement: Movement!
    // END-UOC-5
    
    override func viewDidLoad() {
        // BEGIN-UOC-6.2
        super.viewDidLoad()

        // END-UOC-6.2
    }
    
    // BEGIN-UOC-7
    func rejectAction(sender: UIButton!) {        
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    // END-UOC-7    
}
