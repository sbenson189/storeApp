//
//  DBHelper.swift
//  StoreAppProject
//


import Foundation
import CoreData
import UIKit

class DBHelper {
    static var inst = DBHelper()
    
    var context : NSManagedObjectContext?
    
    init() {
        context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
    }
    
    //Adds a new customer to the database
    func addCustomer(guestDataObject: [String:String]) {
        
        let customer = NSEntityDescription.insertNewObject(forEntityName: "Customer", into: context!) as! Customer
        
        customer.username = guestDataObject["username"]
        customer.password = guestDataObject["password"]
        
        do {
            try context?.save()
        } catch(let exception) {
            print(exception.localizedDescription)
        }
        
        
    }
    
    //Returns the Customer object from the model with the specified username
    func getCustomer(username: String) -> Customer {
        var customer = Customer()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName:"Customer")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        fetchReq.fetchLimit = 1
        
        do {
            let res = try context?.fetch(fetchReq) as! [Customer]
            if (res.count != 0){
                customer = res.first!
            } else {
                print("data not found")
            }
        } catch (let exception) {
            print(exception.localizedDescription)
        }
        
        return customer
    }
    
    //Updates the password of an existing customer in the database
    func updateCustomer(_ username: String, withNewPassword password: String) {
        
        var customer = Customer()
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Customer")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        
        do {
            let res = try context?.fetch(fetchReq)
            if (res?.count != 0) {
                customer = res?.first as! Customer
                customer.password = password
                try context?.save()
            }
        } catch {
            print("error with fetching data or saving context")
        }
    }
    
    func getOneCustomer (username : String)-> Customer { // checks for one specific instance of account credentials to see if it exists in coredata
        var a : Customer?
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
        fetchReq.predicate = NSPredicate(format: "username == %@", username)
        
        fetchReq.fetchLimit = 1
        do {
            let req = try context?.fetch(fetchReq) as! [Customer]
            if(req.count != 0){
                a = req.first!
            }
            else { // Customer data doesn't exist
                print("Customer data not found.")
            }
        }
        catch {
            print("Error.")
        }
        
        return a!
    }
    
    
    
}
