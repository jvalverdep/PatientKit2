//
//  Treatment.swift
//  Patient-Kit
//
//  Created by Javier Valverde on 6/27/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Treatment {
    var id: Int
    var appointmentId: Int
    var notes: String
    var treatmentDetails: [TreatmentDetail]
    
    init(id: Int, appointmentId: Int, notes: String, treatmentDetails: [TreatmentDetail]) {
        self.id = id
        self.appointmentId = appointmentId
        self.notes = notes
        self.treatmentDetails = treatmentDetails
    }
    
    public static func from(jsonTreatment: JSON) -> Treatment {
        return Treatment.init(id: jsonTreatment["id"].intValue,
                              appointmentId: jsonTreatment["appointment_id"].intValue,
                              notes: jsonTreatment["notes"].stringValue,
                              treatmentDetails: TreatmentDetail.from(jsonTreatmentDetail: jsonTreatment["treatment_details"].arrayValue))
    }
}
