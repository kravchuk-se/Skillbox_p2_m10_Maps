//
//  YMKPoint+.swift
//  Skillbox_m10 (Maps)
//
//  Created by Kravchuk Sergey on 07.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import YandexMapKit
import CoreLocation

extension YMKPoint {
    convenience init(coordinate: CLLocationCoordinate2D) {
        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}
