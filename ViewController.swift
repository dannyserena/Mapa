//
//  ViewController.swift
//  Mapa
//
//  Created by user119214 on 6/13/16.
//  Copyright © 2016 user119214. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var precisao :UILabel!
    @IBOutlet weak var velocidade :UILabel!
    @IBOutlet weak var longitude :UILabel!
    
    let regionRadius : CLLocationDistance = 2000.0
    var locationManager : CLLocationManager! = nil
    var iniciado : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled()){
            self.locationManager = CLLocationManager()
            self.locationManager.delegate = self
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
            self.iniciado = true
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[CLLocation])         {
        
        let location = locations.last
        self.latitude.text = "Latitude = \(location?.coordinate.latitude)"
        self.longitude.text = "Longitude = \(location?.coordinate.longitude)"
        self.altitude.text = "Altitude = \(location?.altitude.description)"
    self.precisao.text = "Precisao = \(location?.horizontalAccuracy)H e (location?.horizontalAccuracy.description)V "
        self.velocidade.text = "Velocidade =  \(location?.speed)"
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location!.coordinate,regionRadius, regionRadius)
        self.mapView.setRegion(coordinateRegion, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

