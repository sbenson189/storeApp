//
//  PaymentMethod+CoreDataProperties.swift
//  StoreAppProject
//
//  Created by admin on 5/25/21.
//
//

import Foundation
import CoreData


extension PaymentMethod {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaymentMethod> {
        return NSFetchRequest<PaymentMethod>(entityName: "PaymentMethod")
    }

    @NSManaged public var typeIndicator: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var cardNum: Int64
    @NSManaged public var cvc: Int64
    @NSManaged public var expDate: NSObject?
    @NSManaged public var zip: Int64
    @NSManaged public var accountNum: Int64
    @NSManaged public var routingNum: Int64
    
}

extension PaymentMethod : Identifiable {

}
