//
//  PaymentMethod+CoreDataClass.swift
//  StoreAppProject
//
//  Created by admin on 5/25/21.
//
//

import Foundation
import CoreData

@objc(PaymentMethod)
public class PaymentMethod: NSManagedObject {
    enum TypeError : Error {
        case noTypeIndicator
    }
    
    func getType() throws -> MethodType {
        guard let type = MethodType(rawValue: (self.typeIndicator ?? "")) else {
            throw TypeError.noTypeIndicator
        }
        return type
    }
    
}
