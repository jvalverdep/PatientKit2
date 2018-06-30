//
//  Frequency.swift
//  Patient-Kit
//
//  Created by Javier Valverde on 6/27/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

class Frequency {
    var id: Int
    var abbreviation: String
    var definition: String
    
    init(id: Int, abbreviation: String, definition: String) {
        self.id = id
        self.abbreviation = abbreviation
        self.definition = definition
    }
    
    public static func from(jsonFrequency: JSON) -> Frequency {
        return Frequency.init(id: jsonFrequency["id"].intValue,
                              abbreviation: jsonFrequency["abbreviation"].stringValue,
                              definition: jsonFrequency["definition"].stringValue)
    }
}
