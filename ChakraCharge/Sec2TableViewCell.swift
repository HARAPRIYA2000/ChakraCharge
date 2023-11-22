//
//  Sec2TableViewCell.swift
//  ChakraCharge
//
//  Created by Harapriya on 22/11/23.
//

import UIKit

class Sec2TableViewCell: UITableViewCell {
    
    @IBOutlet weak var accuracyPercentages: UILabel!
    @IBOutlet weak var caloryAmount: UILabel!
    @IBOutlet weak var repsAmount: UILabel!
    @IBOutlet weak var workoutDuration: UILabel!
    
    static let nibForSec2 = UINib(nibName: "Sec2TableViewCell", bundle: nil)
    static let identifierForSec2 = "Sec2TableViewCell"
    
    @IBAction func tryNowButton(_ sender: UIButton) {
        
    }
    
}
