//
//  LocationModel.swift
//  Memory Game IOS V2
//
//  Created by Mor Soferian on 6/12/20.
//  Copyright © 2020 Mor Soferian. All rights reserved.
//

import Foundation

class LocationModel : Codable {
    
    var lat : Double?
    var lng : Double?
    
    init(lat : Double, lng : Double) {
        self.lat = lat
        self.lng = lng
    }
    
    
}
