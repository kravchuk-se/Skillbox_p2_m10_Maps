//
//  PlacesDataSource.swift
//  Skillbox_m10 (Maps)
//
//  Created by Kravchuk Sergey on 03.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

protocol PlacesDataSource: class {
    
    var places: [Place] { get set }
    
}
