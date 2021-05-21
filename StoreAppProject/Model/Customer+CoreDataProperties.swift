//
//  Customer+CoreDataProperties.swift
//  StoreAppProject
//
//  Created by admin on 5/21/21.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension Customer : Identifiable {

}
