//
//  ViewController.swift
//  Test2
//
//  Created by Mac on 21.10.2020.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        data()
    }
    
    func data() {
        
        guard let url = URL(string: "https://desolate-shelf-18786.herokuapp.com/list") else { return }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            let session = URLSession.shared
        let task = session.dataTask(with: request) { [self] (data, response, error) in


                //print(JSON(data))
                guard let data = data else { return }
                do{
                    let cities = try JSONDecoder().decode([Instruction].self, from: data)
                    for a in cities {
                        Arrays.sharedInstance.id.append(a.id)
                        Arrays.sharedInstance.name.append(a.name)
                        Arrays.sharedInstance.price.append(a.price)
                        Arrays.sharedInstance.currency.append(a.currency)
                        Arrays.sharedInstance.imageURL.append(a.imageURL)
                        Arrays.sharedInstance.stock.append(a.stock)
                    }
                    DispatchQueue.main.async {
                        collectionView.reloadData()
                    }
                } catch(let error) {
                  print(error)
                }
            }
            task.resume()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Arrays.sharedInstance.name.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        print(Arrays.sharedInstance.adetSuper)
        print("beratberat")
        print(Arrays.sharedInstance.name.count)
        cell.nameLabel.text = Arrays.sharedInstance.name[indexPath.item]
        cell.imageView.sd_setImage(with: URL(string: Arrays.sharedInstance.imageURL[indexPath.item]))
        cell.moneyLabel.text = "₺\(Arrays.sharedInstance.price[indexPath.item])"
        cell.pieceLabel.text = "\(Arrays.sharedInstance.adetSuper[indexPath.item])"
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(indexPath.item)
        Arrays.sharedInstance.d = Arrays.sharedInstance.name[indexPath.item]
        Arrays.sharedInstance.nameSelect.append(Arrays.sharedInstance.name[indexPath.item])
        Arrays.sharedInstance.imageUrlSelect.append(Arrays.sharedInstance.imageURL[indexPath.item])
        Arrays.sharedInstance.priceSelect.append(Arrays.sharedInstance.price[indexPath.item])
        Arrays.sharedInstance.stockEnd = Arrays.sharedInstance.stock[indexPath.item]
        Arrays.sharedInstance.idSelect.append(Arrays.sharedInstance.id[indexPath.item])
        Arrays.sharedInstance.idSelectNow = Arrays.sharedInstance.id[indexPath.item]
        //print(Arrays.sharedInstance.stockEnd)
        Arrays.sharedInstance.a = Arrays.sharedInstance.idSelect.count - 2
        Arrays.sharedInstance.stockTableView.append(Arrays.sharedInstance.stockEnd)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "go", sender: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        collectionView.reloadData()
        
    }
    
    @IBAction func denemeButton(_ sender: Any) {
        print(Arrays.sharedInstance.adetSuper)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Arrays.sharedInstance.adetSuper = Arrays.sharedInstance.array
        //print(Arrays.sharedInstance.adetSuper)
    }
    
}

