//
//  Sectin1TableViewCell.swift
//  ChakraCharge
//
//  Created by Harapriya on 20/11/23.
//

import UIKit

class Sectin1TableViewCell: UITableViewCell {
    
    @IBOutlet weak var percentagesLabel: UILabel!
    @IBOutlet weak var sec1DataLabel: UILabel!
    @IBOutlet weak var sec1Progress: UIProgressView!
    
    static let nib = UINib(nibName: "Sectin1TableViewCell", bundle: nil)
    static let identifier = "Sectin1TableViewCell"
    
}
