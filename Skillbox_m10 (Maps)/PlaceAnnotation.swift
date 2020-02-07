//
//  PlaceAnnotation.swift
//  Skillbox_m10 (Maps)
//
//  Created by Kravchuk Sergey on 03.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation
import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var color: UIColor
    var image: UIImage?
    
    init(place: Place) {
        coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
        title = place.name
        image = place.imageName == nil ? nil : UIImage(named: place.imageName!)
        color = UIColor(hex: place.color)
        
        super.init()
    }
}
