//
//  Section4CollectionViewCell.swift
//  ChakraCharge
//
//  Created by Harapriya on 21/11/23.
//

import UIKit

class Section4CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sec4Images: UIImageView!
    @IBOutlet weak var sec4ImageIfChangeNeed: UIImageView!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var name4: UILabel!
    
    static let nibForSec4Collection = UINib(nibName: "Section4CollectionViewCell", bundle: nil)
    static let identifierForSec4Collection = "Section4CollectionViewCell"

}
