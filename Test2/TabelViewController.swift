//
//  TabelViewController.swift
//  Test2
//
//  Created by Mac on 22.10.2020.
//

import UIKit

class TabelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toplamLabel: UILabel!
    
    var t = 0
    var f = 0
    var y = -1
    var u = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Sepet", style: UIBarButtonItem.Style.plain, target: self, action: #selector(sepetButton))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Arrays.sharedInstance.goEndNumber.append(Arrays.sharedInstance.goNumber)
        //print(Arrays.sharedInstance.goEndNumber)
        
        Arrays.sharedInstance.name.removeAll()
        Arrays.sharedInstance.price.removeAll()
        Arrays.sharedInstance.currency.removeAll()
        Arrays.sharedInstance.imageURL.removeAll()
        Arrays.sharedInstance.stock.removeAll()
    }
    
    @objc func sepetButton() {
        performSegue(withIdentifier: "go2", sender: nil)
        print(Arrays.sharedInstance.id)
        print(Arrays.sharedInstance.idSelectArrayTableView)
        for a in Arrays.sharedInstance.id {
            u = u + 1
            if a == Arrays.sharedInstance.idSelectArrayTableView[t] {
                print("berat")
                if t < (Arrays.sharedInstance.idSelectArrayTableView.count - 1) {
                t = t + 1
                    print(t)
                }
                y = y + 1
                Arrays.sharedInstance.adetSuper[u] = (Arrays.sharedInstance.goEndNumber[y])
            }
            else {
                Arrays.sharedInstance.adetSuper[u] = 0
            }
        }
        print(Arrays.sharedInstance.adetSuper)
        Arrays.sharedInstance.array = Arrays.sharedInstance.adetSuper
    }
    
    
    @IBAction func sepetOnayButton(_ sender: Any) {
        toplamLabel.text = "\(Arrays.sharedInstance.toplam)"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arrays.sharedInstance.nameSelect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        for idNow in Arrays.sharedInstance.idSelect {
            if idNow == Arrays.sharedInstance.idSelectNow {
        cell.malLabel.text = Arrays.sharedInstance.nameSelect[indexPath.row]
        cell.imageViewTC.sd_setImage(with: URL(string:Arrays.sharedInstance.imageUrlSelect[indexPath.row]))
        cell.fiyatLabel.text = "\(Arrays.sharedInstance.priceSelect[indexPath.row] * Double(Arrays.sharedInstance.goEndNumber[indexPath.row]))"
        cell.pieceLabel.text = "\(Arrays.sharedInstance.goEndNumber[indexPath.row])"
                
                if let NewPointsText = cell.fiyatLabel.text,
                        let NewPointsValue = Double(NewPointsText){
                    Arrays.sharedInstance.toplam = Arrays.sharedInstance.toplam + NewPointsValue
                }
        }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        Arrays.sharedInstance.stockTableViewEnd = Arrays.sharedInstance.stockTableView[indexPath.row]
        Arrays.sharedInstance.idSelectTableView = Arrays.sharedInstance.idSelect[indexPath.row]
        Arrays.sharedInstance.idSelectArrayTableView.append(Arrays.sharedInstance.idSelect[indexPath.row])
        //print(Arrays.sharedInstance.idSelectTableView)
        //print(Arrays.sharedInstance.idSelectArrayTableView)
        Arrays.sharedInstance.b = Arrays.sharedInstance.idSelectArrayTableView.count - 2
    }

}
