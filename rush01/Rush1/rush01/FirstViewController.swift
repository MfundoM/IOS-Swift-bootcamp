//
//  FirstViewController.swift
//  rush01
//
//  Created by Senaki SEKESE on 2018/10/13.
//  Copyright © 2018 Anthony CONTASSOT-VIVIER. All rights reserved.
//
import Foundation
import MapKit
import CoreLocation

class FirstViewController: UIViewController, UISearchBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    

    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
    
            switch (sender.selectedSegmentIndex) {
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
    }
    var locationManager = CLLocationManager()
    
    @IBAction func searchBar(_ sender: UIBarButtonItem) {
    
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        //activity indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        //hide search bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //creating a search request
        let searchReq = MKLocalSearchRequest()
        searchReq.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchReq)
        activeSearch.start {(response, error) in
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            if response == nil
            {
                let alert = UIAlertController(title: "System Alert", message: error?.localizedDescription ?? "error", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                //print (error?.localizedDescription ?? "error")
            }
            else
            {
                //remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                //getting data from response
                let lat = response?.boundingRegion.center.latitude
                let lon = response?.boundingRegion.center.longitude
                
                //create annotations based on data recieved
                let anno = MKPointAnnotation()
                anno.title = searchBar.text
                anno.coordinate = CLLocationCoordinate2DMake(lat!, lon!)
                self.mapView.addAnnotation(anno)
                
                //zooming in on annotations
                
                let coords:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat!,lon!)
                let span = MKCoordinateSpanMake(0.005, 0.005)
                let region = MKCoordinateRegionMake(coords, span)
                self.mapView.setRegion(region, animated: true)
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        //accessing user location)
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.005, 0.005)
        let mylocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(mylocation,span)
        mapView.setRegion(region, animated: true)
        
        self.mapView.showsUserLocation = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
