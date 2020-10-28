//
//  CollectionViewCell.swift
//  Test2
//
//  Created by Mac on 22.10.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pieceLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var number = Int()
    
    @IBAction func plasButton(_ sender: Any) {
        multiNumber()
        number = number + 1
        if number <= Arrays.sharedInstance.stockEnd {
            pieceLabel.text = "\(number)"
            Arrays.sharedInstance.goNumber = number
            
        }
    }
    
    @IBAction func minusLabel(_ sender: Any) {
        Arrays.sharedInstance.goNumber = Arrays.sharedInstance.goNumber - 1
        pieceLabel.text = "\(Arrays.sharedInstance.goNumber)"
    }
    
    func multiNumber() {
       
        if Arrays.sharedInstance.a >= 0 {
            if Arrays.sharedInstance.idSelectNow != Arrays.sharedInstance.idSelect[Arrays.sharedInstance.a] {
                Arrays.sharedInstance.goEndNumber.append(Arrays.sharedInstance.goNumber)
                Arrays.sharedInstance.a = Arrays.sharedInstance.a + 1
        }
        }
    }
    
}
