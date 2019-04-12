//
//  ViewController.swift
//  Core Location
//
//  Created by Anuranjan Bose on 12/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


protocol ToastLabel {
    func displayToast(with message: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var toastLabel: UILabel!
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    let countryCode: String = Locale.current.regionCode!
    
    
    @IBAction func showImageButton(_ sender: UIButton) {
        checkLocationServices()
       // print(countryCode)
        if countryCode == "US" {
            toastLabel.displayToast(with: "You are in US")
            let url = URL(string: "http://www.newsonair.com/writereaddata/News_Pictures/NAT/2018/Nov/NPIC-201811142185.jpg")
            let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let data = data, error == nil else {return}
                DispatchQueue.main.async() {
                    let image = UIImage(data: data)
                    self.imageView.image = image
                }
            }
            task.resume()
        } else {
            //toastLabel.displayToast(with: "You are not in US")
        }
        
    }
    
//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
//
//    func downloadImage(from url: URL) {
//        print("Download started")
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else {return}
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download finished")
//            DispatchQueue.main.async() {
//                self.imageView.image = UIImage(data: data)
//            }
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            //set up location manager
            setUpLocationManager()
            checkLocationAuthorization()
        } else {
            // show alert to the user that they have to turn this on
        }
    }
    
    //To center-zoom in on user's current location
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            //Do Map Stuff
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert instruction how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        default:
            print("Default case")
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension UILabel: ToastLabel {
    func displayToast(with message: String) {
        self.isHidden = false
        self.backgroundColor = .cyan
        self.clipsToBounds = true
        self.text = message
        UIView.animate(withDuration: 3, delay: 3.0, options: .transitionFlipFromTop, animations: {self.alpha = 0.0}, completion: {(isCompleted) in })
    }
}
