//
//  ViewController.swift
//  Mobile Mapper
//
//  Created by SESP Walkup on 7/10/19.
//  Copyright © 2019 SESP Walkup. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let northwesternAnnotation = MKPointAnnotation()
    let locationManager = CLLocationManager()
    let address = "Mount Rushmore"
    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude = 42.055984
        let longitude = -87.675171
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        northwesternAnnotation.coordinate = coordinate
        northwesternAnnotation.title = "Northwestern University"
        mapView.addAnnotation(northwesternAnnotation)
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        geocoder.geocodeAddressString(address){ (placemarks, error) in for placemark in placemarks!{
                let annotation = MKPointAnnotation()
            annotation.coordinate = (placemark.location?.coordinate)!
            annotation.title = placemark.name
            self.mapView.addAnnotation(annotation)
            }
            
            
        }
    }


}

