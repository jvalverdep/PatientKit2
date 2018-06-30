//
//  Appointment.swift
//  Patient-Kit
//
//  Created by zcrome on 5/21/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Appointment{
    var id: Int
	var patientId: Int
    var dot: Int
	var height: Double
	var weight: Double
	var glucoseTest: Double
    var reason: String
	var notes: String
    var doctorOperationTime: DoctorOperationTime
    var treatment: Treatment
    
    init(id: Int, patientId: Int, dot: Int, height: Double, weight: Double, glucoseTest: Double,
         reason: String, notes: String, doctorOperationTime: DoctorOperationTime, treatment: Treatment) {
        self.id = id
		self.patientId = patientId
        self.dot = dot
		self.height = height
		self.weight = weight
        self.glucoseTest = glucoseTest
		self.reason = reason
        self.notes = notes
//        self.scheduled = UtilDates.getDate(stringDate: scheduled)!
        self.doctorOperationTime = doctorOperationTime
        self.treatment = treatment
	}
	
	public static func from(jsonAppointment: JSON) -> Appointment {
        return Appointment(id: jsonAppointment["id"].intValue,
                           patientId: jsonAppointment["patient_id"].intValue,
                           dot: jsonAppointment["dot"].intValue,
                           height: jsonAppointment["height"].doubleValue,
                           weight: jsonAppointment["weight"].doubleValue,
                           glucoseTest: jsonAppointment["glucotest"].doubleValue,
                           reason: jsonAppointment["reason"].stringValue,
                           notes: jsonAppointment["notes"].stringValue,
                           doctorOperationTime: DoctorOperationTime.from(jsonDoctorOperationTime: jsonAppointment["doctor_operation_time"]),
                           treatment: Treatment.from(jsonTreatment: jsonAppointment["treatment"]))
	}
	
	public static func from(jsonAppointments: [JSON]) -> [Appointment] {
		var appointments = [Appointment]()
		let count = jsonAppointments.count
		for i in 0..<count {
			appointments.append(Appointment.from(jsonAppointment: jsonAppointments[i]))
		}
		return appointments
	}
	
	
}
