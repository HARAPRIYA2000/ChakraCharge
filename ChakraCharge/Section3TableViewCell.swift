//
//  Section3TableViewCell.swift
//  ChakraCharge
//
//  Created by Harapriya on 21/11/23.
//

import UIKit

class Section3TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var sec3CollectionView: UICollectionView!
    
    static let nibForSec3 = UINib(nibName: "Section3TableViewCell", bundle: nil)
    static let identifierForSec3 = "Section3TableViewCell"
    
    var cellFromStructureData: GetAllDataAPI? {
        didSet{
            sec3CollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sec3CollectionView.dataSource = self
        sec3CollectionView.delegate = self
        self.sec3CollectionView.register(Sec3CollectionViewCell.nibForSec3Collection, forCellWithReuseIdentifier: Sec3CollectionViewCell.identifierForSec3Collection)
    }
    
    @IBAction func seeAllButton(_ sender: UIButton) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sec3CollectionView.dequeueReusableCell(withReuseIdentifier: Sec3CollectionViewCell.identifierForSec3Collection, for: indexPath) as! Sec3CollectionViewCell
        if indexPath.row == 0 {
            cell.name1.text = cellFromStructureData?.data.section3.plan1.planName
            cell.name2.text = cellFromStructureData?.data.section3.plan1.difficulty
            return cell
        }
        else {
            cell.name1.text = cellFromStructureData?.data.section3.plan2.planName
            cell.name2.text = cellFromStructureData?.data.section3.plan2.difficulty
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
