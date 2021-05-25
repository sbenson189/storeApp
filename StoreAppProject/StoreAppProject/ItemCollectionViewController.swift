//
//  ItemCollectionViewController.swift
//  StoreAppProject
//
//  Created by Home on 5/24/21.
//

import UIKit



class ItemCollectionViewController: UICollectionViewController {

    @IBOutlet var collectView: UICollectionView!
    //    let data: [String] = ["item1","item2","item3","item4","item5","item6","item7","item8","item1","item2","item3","item4","item5","item6","item7","item8","item1","item2","item3","item4","item5","item6","item7","item8"]
//
//    let price: [Double] = [13.0,2.99,10.59,20.0,13.0,2.99,10.59,20.0,13.0,2.99,10.59,20.0,13.0,2.99,10.59,20.0,13.0,2.99,10.59,20.0,13.0,2.99,10.59,20.0]
//
//    let images = ["1","2","3","4","5","6","7","8","9","1","2","3","4","5","6","7","8","9","1","2","3","4","5","6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectView.dataSource = self
        collectView.delegate = self
     
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inventory.count
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      //  var cell = UICollectionViewCell()
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ItemCollectionViewCell
            
        cell?.configure(with: inventory[indexPath.item])
        
        return cell!
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController =  storyboard?.instantiateViewController(identifier: "ItemViewController") as? ItemViewController
    
        viewController?.image = inventory[indexPath.item].image
        viewController?.name = inventory[indexPath.item].name
        viewController?.itemInfo = inventory[indexPath.item].description
        viewController?.index  = indexPath.item
        
        let haptic = UIImpactFeedbackGenerator(style: .soft)
        haptic.impactOccurred()
        
        self.present(viewController!, animated: true, completion: nil)
    }
}
