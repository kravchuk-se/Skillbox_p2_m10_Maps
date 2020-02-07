//
//  Place.swift
//  Skillbox_m10 (Maps)
//
//  Created by Kravchuk Sergey on 03.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import CoreLocation

struct Place {
    var name: String
    var imageName: String?
    var color: String
    let latitude:Double
    let longitude: Double
}

extension Place: CustomStringConvertible {
    var description: String {
        "location name: \(name); la: \(latitude); lo: \(longitude)"
    }
}


