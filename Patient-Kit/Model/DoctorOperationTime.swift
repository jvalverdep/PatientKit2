//
//  DoctorOperationTime.swift
//  Patient-Kit
//
//  Created by Javier Valverde on 6/27/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class DoctorOperationTime {
    var id: Int
    var operationTime: OperationTime
    var doctor: Doctor
    
    init(id: Int, operationTime: OperationTime, doctor: Doctor) {
        self.id = id
        self.operationTime = operationTime
        self.doctor = doctor
    }
    
    public static func from(jsonDoctorOperationTime: JSON) -> DoctorOperationTime {
        return DoctorOperationTime.init(id: jsonDoctorOperationTime["id"].intValue,
                                        operationTime: OperationTime.from(jsonOperationTime: jsonDoctorOperationTime["operation_time"]),
                                        doctor: Doctor.from(jsonDoctor: jsonDoctorOperationTime["doctor"]))
    }
}
