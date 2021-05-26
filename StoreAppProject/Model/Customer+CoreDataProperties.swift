//
//  Customer+CoreDataProperties.swift
//  
//
//  Created by admin on 5/25/21.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var password: String?
    @NSManaged public var phoneNumber: Int64
    @NSManaged public var username: String?

}
