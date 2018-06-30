//
//  DoctorWorkHour.swift
//  Patient-Kit
//
//  Created by Javier Valverde on 6/30/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class DoctorWorkHour {
    var doctorId: Int
    var fullName: String?
    var profession: String
    var doctorOperationTimeId: Int
    var start: String
    var end: String
    
    init(doctorId: Int, fullName: String, profession: String, doctorOperationTimeId: Int, start: String, end: String) {
        self.doctorId = doctorId
        self.fullName = fullName
        self.profession = profession
        self.doctorOperationTimeId = doctorOperationTimeId
        self.start = start
        self.end = end
    }
    
    public static func from(jsonDoctorWorkHour: JSON) -> DoctorWorkHour {
        return DoctorWorkHour.init(doctorId: jsonDoctorWorkHour["doctor_id"].intValue, fullName: jsonDoctorWorkHour["full_name"].stringValue, profession: jsonDoctorWorkHour["profession"].stringValue, doctorOperationTimeId: jsonDoctorWorkHour["doctor_operation_time_id"].intValue, start: jsonDoctorWorkHour["start"].stringValue, end: jsonDoctorWorkHour["end"].stringValue)
    }
    
    public static func from(jsonDoctorWorkHours: [JSON]) -> [DoctorWorkHour] {
        var doctorWorkHours = [DoctorWorkHour]()
        let count = jsonDoctorWorkHours.count
        for i in 0..<count {
            doctorWorkHours.append(DoctorWorkHour.from(jsonDoctorWorkHour: jsonDoctorWorkHours[i]))
        }
        return doctorWorkHours
    }
}
