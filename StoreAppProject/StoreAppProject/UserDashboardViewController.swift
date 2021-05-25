//
//  UserDashboardViewController.swift
//  StoreAppProject
//
//  Created by Scott Benson on 5/21/21.
//

import UIKit
import UserNotifications


class UserDashboardViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var dealsCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var catogeries:[Category] = [
        .init(id: "id1", name: "Egypt Dishs", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Oman Dishs", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "jordn Dishs", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "USA Dishs", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Qanter Dishs", image: "https://picsum.photos/100/200")
    ]
    
    var popualr:[Product1] = [
        .init(id: "id1", image: "https://picsum.photos/100/200", description: "Nice And Beuti Pizza Nice And Beuti Pizza Nice And Beuti Pizza"),
        .init(id: "id2", image: "https://picsum.photos/100/200",description: "Nice And Beuti Indomi Nice And Beuti Indomi Nice And Beuti Indomi"),
        .init(id: "id3", image: "https://picsum.photos/100/200", description: "Nice And Beuti Cola Nice And Beuti Cola Nice And Beuti Cola"),
        .init(id: "id4", image: "https://picsum.photos/100/200",description: "Nice And Beuti Kofta Nice And Beuti Kofta Nice And Beuti Kofta"),
        .init(id: "id5", image: "https://picsum.photos/100/200", description: "Nice And Beuti Bashamel Nice And Beuti Bashamel"),
    ]
    
    var deals:[Product1] = [
        
        .init(id: "id1", image: "https://picsum.photos/100/200", description: "Nice And Beuti Batata Nice And Beuti Batata"),
        .init(id: "id2", image: "https://picsum.photos/100/200", description: "Nice And Beuti Pepsi Nice And Beuti Pepsi Nice And Beuti Pepsi"),
        .init(id: "id3", image: "https://picsum.photos/100/200",  description: "Nice And Beuti Mahshey Nice And Beuti Mahshey"),
        .init(id: "id4", image: "https://picsum.photos/100/200", description: "Nice And Beuti nodels Nice And Beuti nodels Nice And Beuti nodels"),
    ]
   
  
    
    //MARK: -> Class Methods
    
  
    
    func addLocalNotifaction() {
        
        //Ask Permission
        let centre = UNUserNotificationCenter.current()
        centre.requestAuthorization(options: [.alert , .sound]) { (grant, error) in
            
            if error == nil {
                print("Error: \(error?.localizedDescription ?? "")")
            }
        }
        //Create Notifaction Content
        let content = UNMutableNotificationContent()
        content.title = "HI 🔴"
        content.body = "Come Again To See New Items.🚚🚛"
        content.sound = .default
        
        //Create Notifaction Trigger
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
        //Create Request
        let uuidString = UUID().uuidString
        let reqeust  = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        centre.add(reqeust) { (error) in
            
        }
    }
}
