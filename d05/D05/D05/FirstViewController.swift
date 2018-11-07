//
//  FirstViewController.swift
//  D05
//
//  Created by Mfundo MTHETHWA on 2018/10/08.
//  Copyright © 2018 Mfundo MTHETHWA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
//    var locations: [CLLocation]
    
    override func viewWillAppear(_ animated: Bool) {
        if (selected == true) {
            if pinSelected == "42" {
                print("42")
                let location = CLLocationCoordinate2D(latitude: 48.8966, longitude: 2.3185)
                let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                self.mapView.setRegion(region, animated: true)
                let pin = customPin(pinTitle: "Ecole 42", pinSubTitle: "96 Boulevard Bessières, 75017 Paris, France", location: location)
                self.mapView.addAnnotation(pin)
                self.mapView.delegate = self
            }
            else if pinSelected == "WeThinkCode_" {
                print("WeThinkCode_")
                let location1 = CLLocationCoordinate2D(latitude: -26.2049, longitude: 28.0402)
                let region1 = MKCoordinateRegion(center: location1, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                self.mapView.setRegion(region1, animated: true)
                let pin1 = customPin(pinTitle: "WeThinkCode_", pinSubTitle: "84 Albertina Sisulu Rd, Johannesburg, 2000", location: location1)
                self.mapView.addAnnotation(pin1)
                self.mapView.delegate = self
            }
            else if pinSelected == "Sandton City" {
                print("Sandton City")
                let location2 = CLLocationCoordinate2D(latitude: -26.1076, longitude: 28.0567)
                let region2 = MKCoordinateRegion(center: location2, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                self.mapView.setRegion(region2, animated: true)
                let pin2 = customPin(pinTitle: "Sandton City", pinSubTitle: "City of Johannesburg Metropolitan Municipality", location: location2)
                self.mapView.addAnnotation(pin2)
                self.mapView.delegate = self
            }
            else if pinSelected == "Kagiso" {
                print("Kagiso")
                let location3 = CLLocationCoordinate2D(latitude: -26.1630, longitude: 26.1630)
                let region3 = MKCoordinateRegion(center: location3, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
                self.mapView.setRegion(region3, animated: true)
                let pin3 = customPin(pinTitle: "Kagiso", pinSubTitle: "Kagiso is a township situated in the Krugersdorp", location: location3)
                self.mapView.addAnnotation(pin3)
                self.mapView.delegate = self
            }
            selected = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let location1 = CLLocationCoordinate2D(latitude: -26.2049, longitude: 28.0402)
        let region1 = MKCoordinateRegion(center: location1, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        self.mapView.setRegion(region1, animated: true)
        let pin1 = customPin(pinTitle: "WeThinkCode_", pinSubTitle: "84 Albertina Sisulu Rd, Johannesburg, 2000", location: location1)
        self.mapView.addAnnotation(pin1)
        self.mapView.delegate = self
        
        let location2 = CLLocationCoordinate2D(latitude: -26.1076, longitude: 28.0567)
        let region2 = MKCoordinateRegion(center: location2, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        self.mapView.setRegion(region2, animated: true)
        let pin2 = customPin(pinTitle: "Sandton City", pinSubTitle: "City of Johannesburg Metropolitan Municipality", location: location2)
        self.mapView.addAnnotation(pin2)
        self.mapView.delegate = self
        
        let location3 = CLLocationCoordinate2D(latitude: -26.1630, longitude: 26.1630)
        let region3 = MKCoordinateRegion(center: location3, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        self.mapView.setRegion(region3, animated: true)
        let pin3 = customPin(pinTitle: "Kagiso", pinSubTitle: "Kagiso is a township situated in the Krugersdorp", location: location3)
        self.mapView.addAnnotation(pin3)
        self.mapView.delegate = self
        
        let location = CLLocationCoordinate2D(latitude: 48.8966, longitude: 2.3185)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        self.mapView.setRegion(region, animated: true)
        let pin = customPin(pinTitle: "Ecole 42", pinSubTitle: "96 Boulevard Bessières, 75017 Paris, France", location: location)
        self.mapView.addAnnotation(pin)
        self.mapView.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "pin")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    @IBAction func carrentLocation(_ sender: UIButton) {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        manager.stopUpdatingLocation()
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 1:
            mapView.mapType = .satellite
            break
        case 2:
            mapView.mapType = .hybrid
            break
        default:
            mapView.mapType = .standard
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

