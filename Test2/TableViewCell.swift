//
//  TableViewCell.swift
//  Test2
//
//  Created by Mac on 23.10.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewTC: UIImageView!
    @IBOutlet weak var pieceLabel: UILabel!
    @IBOutlet weak var malLabel: UILabel!
    @IBOutlet weak var fiyatLabel: UILabel!
    
    var number = Int()
    var money = Double()
    var b = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
       
    }
    
    @IBAction func positiveLabel(_ sender: Any) {
        
        if let NewPointsText = pieceLabel.text,
                let NewPointsValue = Int(NewPointsText){
                number = NewPointsValue
        }
            if let fiyat = fiyatLabel.text,
               let fiyatSon = Double(fiyat){
                money = fiyatSon / Double(number)
            }
        if number < Arrays.sharedInstance.stockTableViewEnd {
                number = number + 1
                if number <= Arrays.sharedInstance.stockTableViewEnd {
                    pieceLabel.text = "\(number)"
                    fiyatLabel.text = "\(money * Double(number))"
                    Arrays.sharedInstance.toplam = Arrays.sharedInstance.toplam + money
                    print(Arrays.sharedInstance.toplam)
                    multiNumber()
                }
        }
    }
    
    @IBAction func lessButton(_ sender: Any) {
        
        if let NewPointsText = pieceLabel.text,
                let NewPointsValue = Int(NewPointsText){
                number = NewPointsValue
        }
        if let fiyat = fiyatLabel.text,
           let fiyatSon = Double(fiyat){
            money = fiyatSon / Double(number)
        }
        
        number = number - 1
        if number >= 0 {
        pieceLabel.text = "\(number)"
            multiNumber()
        }
        fiyatLabel.text = "\(money * Double(number))"
        Arrays.sharedInstance.toplam = Arrays.sharedInstance.toplam - money
        //NotificationCenter.default.post(name: NSNotification.Name("reflesh"), object: nil)
    }
    
    func multiNumber() {
       
        for a in Arrays.sharedInstance.idSelectArrayTableView {
            b = b + 1
            if a == Arrays.sharedInstance.idSelectTableView {
                Arrays.sharedInstance.goEndNumber[b] = number
                b = -1
                print(Arrays.sharedInstance.goEndNumber)
            }
        }
    }
    
}
