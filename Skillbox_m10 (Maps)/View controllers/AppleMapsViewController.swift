//
//  AppleMapsViewController.swift
//  Skillbox_m10 (Maps)
//
//  Created by Kravchuk Sergey on 03.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import UIKit
import MapKit


class AppleMapsViewController: UIViewController, PlacesDataSource {

    @IBOutlet weak var mapView: MKMapView!
    
    var places: [Place] = []
    var locationManager: CLLocationManager!
    var placeAnnotations: [PlaceAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMapView()
        setupLocationManager()
        updateAnnotations(with: places)
        centerMapAtAnnotations(placeAnnotations)
     
        locationManager.requestWhenInUseAuthorization()
    }
 
    private func setupMapView() {
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "PlaceAnnotation")
        
        mapView.mapType = .mutedStandard
        mapView.delegate = self
    }
    
    private func centerMapAtAnnotations(_ annotations: [MKAnnotation]) {
        mapView.showAnnotations(annotations, animated: false)
    }
    
    private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    private func updateAnnotations(with places: [Place]) {
        placeAnnotations = places.map { PlaceAnnotation(place: $0) }
        placeAnnotations.forEach(mapView.addAnnotation)
    }
    
}

extension AppleMapsViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "PlaceAnnotation")
        if let placeAnnotation = annotation as? PlaceAnnotation {
            if let image = placeAnnotation.image {
                annotationView.glyphImage = image
            } else {
                annotationView.glyphText = placeAnnotation.title?.first.map{ String($0) }
            }
            annotationView.markerTintColor = placeAnnotation.color
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            let title = (annotation.title ?? "") ?? ""
            print("did select annotation: \"\(title)\" at: \(annotation.coordinate)")
        }
    }
}

extension AppleMapsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            mapView.showsUserLocation = true
        default:
            mapView.showsUserLocation = false
        }
    }
}


