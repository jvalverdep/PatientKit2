//
//  OperationTime.swift
//  Patient-Kit
//
//  Created by Javier Valverde on 6/27/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class OperationTime {
    var id: Int
    var start: String
    var end: String
    
    init(id: Int, start: String, end: String) {
        self.id = id
        self.start = start
        self.end = end
    }
    
    public static func from(jsonOperationTime: JSON) -> OperationTime {
        return OperationTime(id: jsonOperationTime["id"].intValue,
                             start: jsonOperationTime["start"].stringValue,
                             end: jsonOperationTime["end"].stringValue)
    }
    
    public static func from(jsonOperationTimes: [JSON]) -> [OperationTime] {
        var operationTimes = [OperationTime]()
        let count = jsonOperationTimes.count
        for i in 0..<count {
            operationTimes.append(OperationTime.from(jsonOperationTime: jsonOperationTimes[i]))
        }
        return operationTimes
    }
}
