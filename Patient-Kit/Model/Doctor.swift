//  Doctor.swift
//  Patient-Kit
//
//  Created by zcrome on 5/25/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Doctor{
	
	var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var profession: String
    var operationTimes: [OperationTime]? = nil
    
//    init(id: Int, firstName: String, lastName: String, email: String, profession: String) {
//        self.id = id
//        self.firstName = firstName
//        self.lastName = lastName
//        self.email = email
//        self.profession = profession
//    }
    
    init(id: Int, firstName: String, lastName: String, email: String, profession: String, operationTimes: [OperationTime]) {
		self.id = id
		self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.profession = profession
        self.operationTimes = operationTimes
	}
    
    public static func from(jsonDoctor: JSON) -> Doctor {
        return Doctor.init(id: jsonDoctor["id"].intValue,
                           firstName: jsonDoctor["first_name"].stringValue,
                           lastName: jsonDoctor["last_name"].stringValue,
                           email: jsonDoctor["email"].stringValue,
                           profession: jsonDoctor["profession"].stringValue,
                           operationTimes: OperationTime.from(jsonOperationTimes: jsonDoctor["operation_times"].arrayValue))
    }
	
}
