//
//  TreatmentDetail.swift
//  Patient-Kit
//
//  Created by Javier Valverde on 6/27/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class TreatmentDetail {
    var id: Int
    var task: String
    var compliance: String
    var frequencyId: Int
    var treatmentId: Int
    var frequency: Frequency
    var route: Route
    
    init(id: Int, task: String, compliance: String, frequencyId: Int,
         treatmentId: Int, frequency: Frequency, route: Route) {
        self.id = id
        self.task = task
        self.compliance = compliance
        self.frequencyId = frequencyId
        self.treatmentId = treatmentId
        self.frequency = frequency
        self.route = route
    }
    
    public static func from(jsonTreatmentDetail: JSON) -> TreatmentDetail {
        return TreatmentDetail.init(id: jsonTreatmentDetail["id"].intValue,
                                    task: jsonTreatmentDetail["task"].stringValue,
                                    compliance: jsonTreatmentDetail["compliance"].stringValue,
                                    frequencyId: jsonTreatmentDetail["frequency_id"].intValue,
                                    treatmentId: jsonTreatmentDetail["treatment_id"].intValue,
                                    frequency: Frequency.from(jsonFrequency: jsonTreatmentDetail["frequency"]),
                                    route: Route.from(jsonFrequency: jsonTreatmentDetail["route"]))
    }
    
    public static func from(jsonTreatmentDetail: [JSON]) -> [TreatmentDetail] {
        var treatmentDetails = [TreatmentDetail]()
        let count = jsonTreatmentDetail.count
        for i in 0..<count {
            treatmentDetails.append(TreatmentDetail.from(jsonTreatmentDetail: jsonTreatmentDetail[i]))
        }
        return treatmentDetails
    }
    
}
