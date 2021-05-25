//
//  ItemViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var itemname: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    var image: UIImage?
    var name: String?
    var itemInfo: String?
    var index: Int?
    var cartInstance = Cart.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        itemname.text = name
        itemImage.image = image
        itemDescription.text = itemInfo
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToCart(_ sender: Any) {
        let product = inventory[index!]
        let haptic = UINotificationFeedbackGenerator()

        if !cartInstance.cartItems.contains(where: {$0.name == product.name}) {
        cartInstance.cartItems.append(product)
            haptic.notificationOccurred(.success)
        } else {
            print("Product is already added to Cart")
            haptic.notificationOccurred(.error)
        }    }
    
 

}
