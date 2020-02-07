//
//  GoogleMapsViewController.swift
//  Skillbox_m10 (Maps)
//
//  Created by Kravchuk Sergey on 03.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapsViewController: UIViewController, PlacesDataSource {

    @IBOutlet weak var mapView: GMSMapView!
    
    var places: [Place] = []
    var placeAnnotations: [GMSMarker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapView()
        updateAnnotations(with: places)
        centerMapAtAnnotations(placeAnnotations)

    }
    
    private func setupMapView() {
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
    }
    private func updateAnnotations(with places: [Place]) {
        places.forEach(addPlace)
    }
    
    private func addPlace(_ place: Place) {
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude))
        marker.title = place.name
        marker.map = mapView
        marker.snippet = place.description
        marker.icon = GMSMarker.markerImage(with: .init(hex: place.color))
        
        placeAnnotations.append(marker)
    }
     
    private func centerMapAtAnnotations(_ annotations: [GMSMarker]) {
        let locations = annotations.map{ $0.position }
        
        let bounds = GMSCoordinateBounds(coordinate: .northEast(for: locations),
                                         coordinate: .southWest(for: locations))
        
        let camera = mapView.camera(for: bounds,
                                    insets: .init(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0))!
        mapView.camera = camera
    }
}

extension GoogleMapsViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let index = placeAnnotations.firstIndex(of: marker)!
        let title = places[index].name
        print("did select annotation: \"\(title)\" at: \(marker.position)")
        return false
    }
}
