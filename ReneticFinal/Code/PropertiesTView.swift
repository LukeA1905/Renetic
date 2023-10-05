//
//  PropertiesTView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 15/04/2023.
//
import CoreLocation
import MapKit
import UIKit


class PropertiesTView: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
   
    @IBOutlet weak var mapView3: MKMapView!
    
    let managerT = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        managerT.desiredAccuracy = kCLLocationAccuracyBest // The more accurate the location is the more battery is used on the users device
        managerT.delegate = self
        managerT.requestWhenInUseAuthorization()
        managerT.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
            
            render(location)
        }
        func render(_ location: CLLocation) {
            
            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1) // Birds eye view of map
            
            let region = MKCoordinateRegion(center: coordinate, span: span)
            
            mapView3.setRegion(region,
                              animated: true)
            
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            mapView3.addAnnotation(pin)
            
            let pin2 = MKPointAnnotation()
            pin2.title = "Greenwich University"
            pin.coordinate = CLLocationCoordinate2D(latitude: 51.481846, longitude: -0.006199)
            mapView3.addAnnotation(pin2)
            
            let pin3 = MKPointAnnotation()
            pin3.title = "Avery Hill"
            pin.coordinate = CLLocationCoordinate2D(latitude: 51.445990, longitude: 0.080470)
            mapView3.addAnnotation(pin3)
            
            mapView3.delegate = self
        }
        
        
    }
    

  

}

