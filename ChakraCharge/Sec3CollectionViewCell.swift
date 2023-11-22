//
//  Sec3CollectionViewCell.swift
//  ChakraCharge
//
//  Created by Harapriya on 21/11/23.
//

import UIKit

class Sec3CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var sec3ImageView: UIImageView!
    
    static let nibForSec3Collection = UINib(nibName: "Sec3CollectionViewCell", bundle: nil)
    static let identifierForSec3Collection = "Sec3CollectionViewCell"
    
}
