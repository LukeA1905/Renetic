//
//  PropertyTenantView.swift
//  ReneticFinal
//
//  Created by Luke Austin on 15/04/2023.
//
import CoreLocation
import MapKit
import UIKit

class PropertyTenantView: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var tempertureLabel: UILabel!
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
            
            mapView.setRegion(region,
                              animated: true)
        }
        
        
    }
    

  

}
