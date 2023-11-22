//
//  Section4TableViewCell.swift
//  ChakraCharge
//
//  Created by Harapriya on 22/11/23.
//

import UIKit

class Section4TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var sec4CollectionView: UICollectionView!
    
    static let nibForSec4 = UINib(nibName: "Section4TableViewCell", bundle: nil)
    static let identifierForSec4 = "Section4TableViewCell"
    
    var cellFromStructureDataForSec4: GetAllDataAPI? {
        didSet{
            sec4CollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sec4CollectionView.dataSource = self
        sec4CollectionView.delegate = self
        self.sec4CollectionView.register(Section4CollectionViewCell.nibForSec4Collection, forCellWithReuseIdentifier: Section4CollectionViewCell.identifierForSec4Collection)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sec4CollectionView.dequeueReusableCell(withReuseIdentifier: Section4CollectionViewCell.identifierForSec4Collection, for: indexPath) as! Section4CollectionViewCell
        
        cell.name1.text = cellFromStructureDataForSec4?.data.section4.category1.categoryName
        cell.name2.text = cellFromStructureDataForSec4?.data.section4.category1.noOfExercises
        cell.name3.text = cellFromStructureDataForSec4?.data.section4.category2.categoryName
        cell.name4.text = cellFromStructureDataForSec4?.data.section4.category2.noOfExercises
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    @IBAction func sec4SeeAllButton(_ sender: UIButton) {
        
    }
}
